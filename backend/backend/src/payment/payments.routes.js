const express = require("express");
const router = express.Router();
const db = require("../config/db");

/**
 * PAYMENT DASHBOARD SUMMARY
 * GET /api/payments/summary
 */
router.get("/summary", async (req, res) => {
  try {
    const totalInvoicesResult = await db.query(
      "SELECT COUNT(*) FROM invoices"
    );

    const totalPaidResult = await db.query(
      "SELECT COALESCE(SUM(paid_amount), 0) AS total_paid FROM payments"
    );

    const outstandingResult = await db.query(`
      SELECT COALESCE(
        SUM(i.invoice_amount - COALESCE(p.total_paid, 0)), 0
      ) AS outstanding
      FROM invoices i
      LEFT JOIN (
        SELECT invoice_id, SUM(paid_amount) AS total_paid
        FROM payments
        GROUP BY invoice_id
      ) p ON i.invoice_id = p.invoice_id
    `);

    const overdueResult = await db.query(`
      SELECT COUNT(*)
      FROM invoices
      WHERE due_date < CURRENT_DATE
      AND status != 'Paid'
    `);

    res.json({
      totalInvoices: Number(totalInvoicesResult.rows[0].count),
      totalPaid: Number(totalPaidResult.rows[0].total_paid),
      outstanding: Number(outstandingResult.rows[0].outstanding),
      overdue: Number(overdueResult.rows[0].count),
    });
  } catch (error) {
    console.error("PAYMENT SUMMARY ERROR:", error);
    res.status(500).json({ message: "Failed to fetch payment summary" });
  }
});

router.get("/invoices", async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        i.invoice_id,
        v.vendor_name,
        i.service_description,
        i.invoice_amount,
        i.status,
        i.settlement_status,
        i.invoice_date,
        i.due_date,
        COALESCE(r.reminder_count, 0) AS reminders
      FROM invoices i
      LEFT JOIN vendors v ON i.vendor_id = v.vendor_id
      LEFT JOIN payment_reminders r ON i.invoice_id = r.invoice_id
      ORDER BY i.due_date
    `);

    res.json(result.rows);
  } catch (err) {
    console.error("FETCH INVOICES ERROR:", err);
    res.status(500).json({ message: "Failed to fetch invoices" });
  }
});

/**
 * VIEW SINGLE INVOICE
 * GET /api/payments/invoices/:invoiceId
 */
router.get("/invoices/:invoiceId", async (req, res) => {
  const { invoiceId } = req.params;

  try {
    // Invoice basic details
    const invoiceResult = await db.query(
      `
      SELECT
        i.invoice_id,
        v.vendor_name,
        i.service_description,
        i.invoice_amount,
        i.status,
        i.settlement_status,
        i.invoice_date,
        i.due_date,
        COALESCE(r.reminder_count, 0) AS reminder_count
      FROM invoices i
      LEFT JOIN vendors v ON i.vendor_id = v.vendor_id
      LEFT JOIN payment_reminders r ON i.invoice_id = r.invoice_id
      WHERE i.invoice_id = $1
      `,
      [invoiceId]
    );

    if (invoiceResult.rows.length === 0) {
      return res.status(404).json({ message: "Invoice not found" });
    }

    // Payment history
    const paymentsResult = await db.query(
      `
      SELECT
        payment_id,
        paid_amount,
        payment_date,
        payment_mode,
        remarks
      FROM payments
      WHERE invoice_id = $1
      ORDER BY payment_date DESC
      `,
      [invoiceId]
    );

    res.json({
      invoice: invoiceResult.rows[0],
      payments: paymentsResult.rows,
    });
  } catch (error) {
    console.error("VIEW INVOICE ERROR:", error);
    res.status(500).json({ message: "Failed to fetch invoice details" });
  }
});

/**
 * ADD PAYMENT (PARTIAL / FULL)
 * POST /api/payments/invoices/:invoiceId/pay
 */
router.post("/invoices/:invoiceId/pay", async (req, res) => {
  const { invoiceId } = req.params;
  const { amount, paymentMode, remarks } = req.body;

  if (!amount || amount <= 0) {
    return res.status(400).json({ message: "Invalid payment amount" });
  }

  try {
    // Insert payment
    await db.query(
      `
      INSERT INTO payments (invoice_id, paid_amount, payment_mode, remarks)
      VALUES ($1, $2, $3, $4)
      `,
      [invoiceId, amount, paymentMode, remarks]
    );

    // Calculate total paid
    const paidResult = await db.query(
      `
      SELECT COALESCE(SUM(paid_amount), 0) AS total_paid
      FROM payments
      WHERE invoice_id = $1
      `,
      [invoiceId]
    );

    const invoiceResult = await db.query(
      `
      SELECT invoice_amount
      FROM invoices
      WHERE invoice_id = $1
      `,
      [invoiceId]
    );

    const totalPaid = Number(paidResult.rows[0].total_paid);
    const invoiceAmount = Number(invoiceResult.rows[0].invoice_amount);

    // Update invoice status
    let status = "Processing";
    let settlementStatus = "Partially Paid";

    if (totalPaid >= invoiceAmount) {
      status = "Paid";
      settlementStatus = "Settled";
    }

    await db.query(
      `
      UPDATE invoices
      SET status = $1, settlement_status = $2
      WHERE invoice_id = $3
      `,
      [status, settlementStatus, invoiceId]
    );

    res.json({
      message: "Payment recorded successfully",
      status,
      settlementStatus,
    });
  } catch (error) {
    console.error("ADD PAYMENT ERROR:", error);
    res.status(500).json({ message: "Failed to add payment" });
  }
});

/**
 * INCREMENT PAYMENT REMINDER
 * POST /api/payments/invoices/:invoiceId/reminder
 */
router.post("/invoices/:invoiceId/reminder", async (req, res) => {
  const { invoiceId } = req.params;

  try {
    await db.query(`
      INSERT INTO payment_reminders (invoice_id, reminder_count, last_reminder_date)
      VALUES ($1, 1, CURRENT_DATE)
      ON CONFLICT (invoice_id)
      DO UPDATE SET
        reminder_count = payment_reminders.reminder_count + 1,
        last_reminder_date = CURRENT_DATE
    `, [invoiceId]);

    res.json({ message: "Reminder sent successfully" });
  } catch (error) {
    console.error("REMINDER ERROR:", error);
    res.status(500).json({ message: "Failed to send reminder" });
  }
});


router.get("/invoices/:invoiceId/attendance", async (req, res) => {
  const { invoiceId } = req.params;

  try {
    // 1. Get invoice details
    const invoiceRes = await db.query(
      `
      SELECT invoice_date, due_date, colo, hall
      FROM invoices
      WHERE invoice_id = $1
      `,
      [invoiceId]
    );

    if (invoiceRes.rows.length === 0) {
      return res.json({
        totalWorkers: 0,
        totalHours: 0,
        workers: [],
      });
    }

    const { invoice_date, due_date, colo, hall } = invoiceRes.rows[0];

    // 2. Attendance aggregation
    const attRes = await db.query(
      `
      SELECT
        a.employee_id,
        a.name AS worker_name,
        COUNT(a.date) AS days_present,
        ROUND(
          SUM(EXTRACT(EPOCH FROM (a.clock_out - a.clock_in)) / 3600),
          2
        ) AS hours_worked
      FROM attendance a
      WHERE a.date BETWEEN $1 AND $2
        AND a.colo = $3
        AND a.hall = $4
        AND a.clock_in IS NOT NULL
        AND a.clock_out IS NOT NULL
      GROUP BY a.employee_id, a.name
      `,
      [invoice_date, due_date, colo, hall]
    );

    const workers = attRes.rows.map((r) => ({
      employeeId: r.employee_id,
      name: r.worker_name,
      daysPresent: Number(r.days_present),
      hoursWorked: Number(r.hours_worked),
    }));

    const totalHours = workers.reduce(
      (sum, w) => sum + w.hoursWorked,
      0
    );

    res.json({
      totalWorkers: workers.length,
      totalHours,
      workers,
    });
  } catch (err) {
    console.error("ATTENDANCE SUMMARY ERROR:", err);
    res.status(500).json({ message: "Failed to fetch attendance" });
  }
});


module.exports = router;

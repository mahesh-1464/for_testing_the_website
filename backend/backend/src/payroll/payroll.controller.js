const pool = require("../config/db");


exports.getPayrollSummary = async (req, res) => {
  try {
   

    // Convert "2025-12" → "2025-12-01"
   const { month } = req.query;



    console.log("MONTH RECEIVED:", month);

    const query = `
      SELECT
  COUNT(*)::int AS total_workers,
  COUNT(*) FILTER (WHERE status = 'Paid')::int AS paid_workers,
  COUNT(*) FILTER (WHERE status = 'Pending')::int AS pending_approval,
  COALESCE(SUM(net_salary), 0)::int AS total_payout
FROM payroll
WHERE month = $1::date

    `;

   const { rows } = await pool.query(query, [month]);

    res.json(rows[0]);
  } catch (error) {
  console.error("PAYROLL SUMMARY ERROR FULL:", error.message);
  console.error(error);
  res.status(500).json({ message: "Failed to load payroll summary" });
  }
};

exports.getPayrollRecords = async (req, res) => {

  const { month } = req.query;

  try {

    const monthDate = `${month}-01`;

    const query = `
      SELECT
        p.employee_id,
        e.name,
        e.role,
        e.vendor AS vendor,
        p.attendance_days,
        p.total_hours,
        p.overtime_hours,
        p.gross_salary,
        p.net_salary,
        p.status,
        p.month
      FROM payroll p
      JOIN employees e
        ON e.employee_id = p.employee_id
      WHERE p.month = $1::date
      ORDER BY e.name
    `;

    const { rows } = await pool.query(query, [monthDate]);

    res.json(rows);

  } catch (error) {

    console.error("PAYROLL RECORDS ERROR FULL:", error.message);
    console.error(error);

    res.status(500).json({
      message: "Failed to load payroll records"
    });

  }
};






exports.getPayrollDetails = async (req, res) => {
  const { employeeId } = req.params;
  const { month } = req.query;

  try {
    const monthDate = `${month}-01`;

    const query = `
      SELECT
        e.employee_id,
        e.name,
        e.role,
        e.vendor,
        p.attendance_days,
        p.total_hours,
        p.overtime_hours,
        e.base_rate,
        e.ot_rate,
        p.deductions,
        p.gross_salary,
        p.net_salary,
        p.status
      FROM payroll p
      JOIN employees e ON e.employee_id = p.employee_id
      WHERE p.employee_id = $1
        AND p.month = $2::date
    `;

    const { rows } = await pool.query(query, [employeeId, monthDate]);

    if (rows.length === 0) {
      return res.status(404).json({ message: "Payroll not found" });
    }

    res.json(rows[0]);
  } catch (error) {
    console.error("PAYROLL DETAILS ERROR:", error);
    res.status(500).json({ message: "Failed to load payroll details" });
  }
};


exports.generatePayroll = async (req, res) => {
  const { month } = req.body;

  try {
    const attendanceQuery = `
      SELECT
        a.employee_id,
        COUNT(DISTINCT a.date) AS attendance_days,
        ROUND(
          SUM(EXTRACT(EPOCH FROM (a.clock_out - a.clock_in)) / 3600)::numeric,
          2
        ) AS total_hours
      FROM attendance a
      WHERE a.status = 'Present'
        AND date_trunc('month', a.date) = DATE $1
        AND a.clock_in IS NOT NULL
        AND a.clock_out IS NOT NULL
      GROUP BY a.employee_id
    `;

    const attendanceResult = await pool.query(attendanceQuery, [month]);

    for (const row of attendanceResult.rows) {
      const empRes = await pool.query(
        `SELECT base_rate, ot_rate FROM employees WHERE employee_id = $1`,
        [row.employee_id]
      );

      if (!empRes.rows.length) continue;

      const { base_rate, ot_rate } = empRes.rows[0];

      const attendanceDays = row.attendance_days;
      const totalHours = row.total_hours;
      const overtimeHours = Math.max(totalHours - attendanceDays * 8, 0);

      const grossSalary =
        attendanceDays * base_rate +
        overtimeHours * ot_rate;

      const deductions = 0;
      const netSalary = grossSalary - deductions;

      await pool.query(
        `
        INSERT INTO payroll (
          employee_id,
          month,
          attendance_days,
          total_hours,
          overtime_hours,
          gross_salary,
          deductions,
          net_salary,
          status
        )
        VALUES ($1,$2,$3,$4,$5,$6,$7,$8,'Pending')
        ON CONFLICT (employee_id, month) DO NOTHING
        `,
        [
          row.employee_id,
          month,
          attendanceDays,
          totalHours,
          overtimeHours,
          grossSalary,
          deductions,
          netSalary,
        ]
      );
    }

    res.json({ message: "Payroll generated successfully" });
  } catch (error) {
    console.error("GENERATE PAYROLL ERROR:", error);
    res.status(500).json({ message: "Payroll generation failed" });
  }
};

exports.updatePayrollStatus = async (req, res) => {
  const { employeeId } = req.params;
  const { month, status } = req.body;

  if (!month || !status) {
    return res.status(400).json({ message: "Month and status are required" });
  }

  try {
    const result = await pool.query(
      `
      UPDATE payroll
      SET status = $1
      WHERE employee_id = $2
        AND month = DATE $3
        AND status != 'Paid'
      RETURNING *
      `,
      [status, employeeId, `${month}-01`]
    );

    if (result.rowCount === 0) {
      return res
        .status(400)
        .json({ message: "Payroll not found or already Paid" });
    }

    res.json({
      message: `Payroll marked as ${status}`,
      payroll: result.rows[0],
    });
  } catch (error) {
    console.error("PAYROLL STATUS UPDATE ERROR:", error);
    res.status(500).json({ message: "Failed to update payroll status" });
  }
};


exports.approvePayroll = async (req, res) => {
  const { employeeId } = req.params;
  const { month } = req.body;

  try {
    const monthDate = `${month}-01`;

    const result = await pool.query(
      `
      UPDATE payroll
      SET status = 'Approved'
      WHERE employee_id = $1
        AND month = $2::date
        AND status = 'Pending'
      RETURNING *
      `,
      [employeeId, monthDate]
    );

    if (result.rowCount === 0) {
      return res.status(400).json({
        message: "Payroll not in Pending state or not found",
      });
    }

    res.json({ message: "Payroll approved successfully" });
  } catch (error) {
    console.error("PAYROLL APPROVE ERROR:", error);
    res.status(500).json({ message: "Failed to approve payroll" });
  }
};

exports.markPayrollPaid = async (req, res) => {
  const { employeeId } = req.params;
  const { month } = req.body;

  try {
    const monthDate = `${month}-01`;

    const result = await pool.query(
      `
      UPDATE payroll
      SET status = 'Paid'
      WHERE employee_id = $1
        AND month = $2::date
        AND status = 'Approved'
      RETURNING *
      `,
      [employeeId, monthDate]
    );

    if (result.rowCount === 0) {
      return res.status(400).json({
        message: "Payroll must be Approved before marking Paid",
      });
    }

    res.json({ message: "Payroll marked as Paid" });
  } catch (error) {
    console.error("PAYROLL PAY ERROR:", error);
    res.status(500).json({ message: "Failed to mark payroll paid" });
  }
};

exports.updatePayrollDeductions = async (req, res) => {
  const { employeeId } = req.params;
  const { month, deductions } = req.body;

  try {
    const monthDate = `${month}-01`;

    const result = await pool.query(
      `
      UPDATE payroll
      SET deductions = $1,
          net_salary = gross_salary - $1
      WHERE employee_id = $2
        AND month = $3::date
        AND status != 'Paid'
      RETURNING *
      `,
      [Number(deductions), employeeId, monthDate]
    );

    if (result.rowCount === 0) {
      return res.status(400).json({
        message: "Payroll not found or already Paid",
      });
    }

    res.json({
      message: "Deductions updated successfully",
      payroll: result.rows[0],
    });
  } catch (error) {
    console.error("PAYROLL DEDUCTION ERROR:", error);
    res.status(500).json({ message: "Failed to update deductions" });
  }
};


// exports.getPayrollRecords = async (req, res) => {
//   const { month } = req.query;

//   try {
//     const query = `
//       SELECT
//         p.employee_id,
//         a.name,
//         a.role,
//         a.colo AS vendor,
//         p.attendance_days,
//         p.total_hours,
//         p.overtime_hours,
//         p.gross_salary,
//         p.net_salary,
//         p.status,
//         p.month
//       FROM payroll p
//       JOIN attendance a ON a.employee_id = p.employee_id
//       WHERE p.month = $1
//       ORDER BY a.name
//     `;

//     const { rows } = await pool.query(query, [month]);
//     res.json(rows);
//   } catch (error) {
//     console.error("PAYROLL RECORDS ERROR:", error);
//     res.status(500).json({ message: "Failed to load payroll records" });
//   }
// };



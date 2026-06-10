const db = require("../config/db");
const { createNotification } = require("../utils/notification.util");
const ExcelJS = require("exceljs");
const PDFDocument = require("pdfkit");

// Worker Feedback
exports.getWorkerFeedback = async (req, res) => {
  try {

    console.log("REQ.USER:", req.user);

    const result = await db.query(`
      SELECT *
      FROM worker_feedback
      ORDER BY created_at DESC
    `);

    console.log("ROWS:", result.rows);

    res.json(result.rows);

  } catch (err) {

    console.error("FETCH ERROR:", err);

    res.status(500).json({
      message: "Failed to fetch feedback"
    });
  }
};

exports.getWorkerFeedbackById = async (req, res) => {
  try {
    const result = await db.query(
      "SELECT * FROM worker_feedback WHERE feedback_id = $1",
      [req.params.id]
    );

    if (result.rowCount === 0)
      return res.status(404).json({ message: "Feedback not found" });

    res.json(result.rows[0]);
  } catch (err) {
    console.error("FETCH FEEDBACK BY ID ERROR", err);
    res.status(500).json({ message: "Failed to fetch feedback" });
  }
};

// Suggestions
exports.getSuggestions = async (req, res) => {
  try {

    const result = await db.query(`
      SELECT
        id,
        title,
        description,
        source,
        status,
        impact,
        created_at
      FROM suggestions
      ORDER BY created_at DESC
    `);

    console.log("SUGGESTIONS:", result.rows);

    res.json(result.rows);

  } catch (err) {

    console.error("FETCH SUGGESTIONS ERROR", err);

    res.status(500).json({
      message: "Failed to fetch suggestions"
    });
  }
};

exports.getSuggestionById = async (req, res) => {
  try {
    const result = await db.query(
      "SELECT * FROM suggestions WHERE suggestion_id = $1",
      [req.params.id]
    );

    if (result.rowCount === 0)
      return res.status(404).json({ message: "Suggestion not found" });

    res.json(result.rows[0]);
  } catch (err) {
    console.error("FETCH SUGGESTION ERROR", err);
    res.status(500).json({ message: "Failed to fetch suggestion" });
  }
};

exports.updateSuggestionStatus = async (req, res) => {
  const { status } = req.body;
  const suggestionId = req.params.id;

  try {
    // Fetch old status
    const prev = await db.query(
      "SELECT status FROM suggestions WHERE suggestion_id = $1",
      [suggestionId]
    );

    if (prev.rowCount === 0) {
      return res.status(404).json({ message: "Suggestion not found" });
    }

    const oldStatus = prev.rows[0].status;

    // Update status
    await db.query(
      "UPDATE suggestions SET status = $1 WHERE suggestion_id = $2",
      [status, suggestionId]
    );

    // Audit log
    await db.query(
      `
      INSERT INTO suggestion_audit
      (suggestion_id, old_status, new_status, changed_by)
      VALUES ($1, $2, $3, $4)
      `,
      [suggestionId, oldStatus, status, req.user.role]
    );

    res.json({ message: "Status updated successfully" });
  } catch (err) {
    console.error("UPDATE SUGGESTION STATUS ERROR", err);
    res.status(500).json({ message: "Failed to update status" });
  }
};


exports.submitWorkerFeedback = async (req, res) => {
 console.log("BODY:", req.body);
  const {
    worker_emp_id,
    worker_name,
    task_title,
    rating,
    feedback_notes
  } = req.body;

  try {
    await db.query(
      `
      INSERT INTO worker_feedback
      (feedback_id, worker_emp_id, worker_name, task_title, rating, feedback_notes, given_by_role)
      VALUES
      ('FB-' || nextval('feedback_seq'), $1, $2, $3, $4, $5, $6)
      `,
      [
        worker_emp_id,
        worker_name,
        task_title,
        rating,
        feedback_notes,
        req.user.role
      ]
    );

await createNotification({
  title: "New Worker Feedback",
  message: `Feedback submitted for ${worker_name} on task "${task_title}"`,
  recipient_role: "Admin",
  redirect_url: "/feedback"
});


// await createNotification({
//   title: "Suggestion Status Updated",
//   message: `Suggestion ${req.params.id} marked as ${status}`,
//   recipient_role: "Supervisor",
//   redirect_url: "/feedback"
// });

    res.json({ message: "Feedback submitted successfully" });
  } catch (err) {
    console.error("SUBMIT FEEDBACK ERROR", err);
    res.status(500).json({ message: "Failed to submit feedback" });
  }
};

exports.exportFeedbackExcel = async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        feedback_id,
        worker_name,
        task_title,
        rating,
        given_by_role,
        feedback_notes,
        created_at
      FROM worker_feedback
      ORDER BY created_at DESC
    `);

    const workbook = new ExcelJS.Workbook();
    const sheet = workbook.addWorksheet("Worker Feedback");

    sheet.columns = [
      { header: "Feedback ID", key: "feedback_id", width: 15 },
      { header: "Worker", key: "worker_name", width: 20 },
      { header: "Task", key: "task_title", width: 30 },
      { header: "Rating", key: "rating", width: 10 },
      { header: "Given By", key: "given_by_role", width: 15 },
      { header: "Comments", key: "feedback_notes", width: 40 },
      { header: "Date", key: "created_at", width: 15 }
    ];

    result.rows.forEach(row => {
      sheet.addRow({
        ...row,
        created_at: new Date(row.created_at).toLocaleDateString()
      });
    });

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      "attachment; filename=worker_feedback.xlsx"
    );

    await workbook.xlsx.write(res);
    res.end();
  } catch (err) {
    console.error("EXPORT FEEDBACK ERROR", err);
    res.status(500).json({ message: "Failed to export feedback" });
  }
};


exports.exportFeedbackPDF = async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        feedback_id,
        worker_name,
        task_title,
        rating,
        given_by_role,
        feedback_notes,
        created_at
      FROM worker_feedback
      ORDER BY created_at DESC
    `);

    const doc = new PDFDocument({ margin: 40, size: "A4" });

    res.setHeader("Content-Type", "application/pdf");
    res.setHeader(
      "Content-Disposition",
      "attachment; filename=worker_feedback.pdf"
    );

    doc.pipe(res);

    // Title
    doc
      .fontSize(18)
      .text("Worker Feedback Report", { align: "center" })
      .moveDown();

    doc.fontSize(10);

    result.rows.forEach((f, index) => {
      doc
        .text(`Feedback ID: ${f.feedback_id}`)
        .text(`Worker: ${f.worker_name}`)
        .text(`Task: ${f.task_title}`)
        .text(`Rating: ${f.rating}`)
        .text(`Given By: ${f.given_by_role}`)
        .text(`Date: ${new Date(f.created_at).toLocaleDateString()}`)
        .text(`Comments: ${f.feedback_notes || "-"}`)
        .moveDown();

      if (index !== result.rows.length - 1) {
        doc
          .moveDown(0.5)
          .moveTo(40, doc.y)
          .lineTo(555, doc.y)
          .stroke();
        doc.moveDown();
      }
    });

    doc.end();
  } catch (err) {
    console.error("EXPORT PDF ERROR", err);
    res.status(500).json({ message: "Failed to export PDF" });
  }
};

exports.getSuggestionAudit = async (req, res) => {
  try {
    const result = await db.query(
      `
      SELECT
        old_status,
        new_status,
        changed_by,
        changed_at
      FROM suggestion_audit
      WHERE suggestion_id = $1
      ORDER BY changed_at DESC
      `,
      [req.params.id]
    );

    res.json(result.rows);
  } catch (err) {
    console.error("SUGGESTION AUDIT ERROR", err);
    res.status(500).json({ message: "Failed to fetch audit logs" });
  }
};


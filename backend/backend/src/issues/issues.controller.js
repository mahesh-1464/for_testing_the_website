const db = require("../config/db");

/* ================= GET ALL ISSUES ================= */

const getAllIssues = async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        issue_id,
        issue_code,
        type,
        title,
        colo,
        priority,
        status,
        description,
        related_task,
        related_worker,
        supervisor_response,
        created_at
      FROM issues
      ORDER BY created_at DESC
    `);

    res.status(200).json(result.rows);

  } catch (error) {
    console.error("GET ISSUES ERROR:", error);

    res.status(500).json({
      message: "Server Error",
    });
  }
};

/* ================= UPDATE STATUS ================= */

const updateIssueStatus = async (req, res) => {
  try {
    const { id } = req.params;

    const { status } = req.body;

    await db.query(
      `
      UPDATE issues
      SET status = $1
      WHERE issue_id = $2
      `,
      [status, id]
    );

    res.status(200).json({
      message: "Issue updated successfully",
    });

  } catch (error) {
    console.error("UPDATE ISSUE ERROR:", error);

    res.status(500).json({
      message: "Server Error",
    });
  }
};

module.exports = {
  getAllIssues,
  updateIssueStatus,
};
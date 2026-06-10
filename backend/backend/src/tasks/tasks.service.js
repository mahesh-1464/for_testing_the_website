const db = require("../config/db");

exports.updateTaskStatus = async (taskId, newStatus) => {

  // 1️⃣ Check task + GPS status from main tasks table
  const { rows } = await db.query(
    `SELECT gps_valid FROM tasks WHERE task_id = $1`,
    [taskId]
  );

  if (!rows.length) {
    throw new Error("Task not found");
  }

  const { gps_valid } = rows[0];

  // 2️⃣ Block completion if GPS invalid
  if (newStatus === "Completed" && gps_valid === false) {
    throw new Error("Task cannot be completed. GPS validation failed.");
  }

  // 3️⃣ Update status
  const update = await db.query(
    `
    UPDATE tasks
    SET status = $1
    WHERE task_id = $2
    RETURNING *
    `,
    [newStatus, taskId]
  );

  return update.rows[0];
};

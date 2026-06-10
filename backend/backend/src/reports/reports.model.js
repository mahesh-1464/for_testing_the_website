const db = require("../config/db");

/**
 * Fetch task completion summary
 */
const getTaskSummary = async () => {
  const query = `
    SELECT
      COUNT(*) FILTER (WHERE completed_at IS NOT NULL) AS completed,
      COUNT(*) FILTER (WHERE completed_at IS NULL) AS pending
    FROM task_workers
  `;

  const { rows } = await db.query(query);
  return rows[0];
};

/**
 * Fetch revenue and orders summary
 */
const getRevenueSummary = async () => {
  const query = `
    SELECT
      COUNT(*) AS orders,
      COALESCE(SUM(total_amount), 0) AS revenue
    FROM invoices
  `;

  const { rows } = await db.query(query);
  return rows[0];
};

/**
 * Fetch attendance summary
 */
const getAttendanceSummary = async () => {
  const query = `
    SELECT
      COALESCE(ROUND(AVG(attendance_percentage)), 0) AS attendance_rate
    FROM monthly_attendance_summary
  `;

  const { rows } = await db.query(query);
  return rows[0];
};

const getTaskCompletionByColo = async () => {
  const query = `
    SELECT
      c.name AS colo,
      COUNT(tw.completed_at) FILTER (WHERE tw.completed_at IS NOT NULL) AS completed,
      COUNT(tw.id) FILTER (WHERE tw.completed_at IS NULL) AS pending
    FROM task_workers tw
    JOIN colos c ON c.id = tw.colo_id
    GROUP BY c.name
    ORDER BY c.name
  `;

  const { rows } = await db.query(query);
  return rows;
};

const getMonthlyRevenueTrend = async () => {
  const query = `
    SELECT
      TO_CHAR(created_at, 'Mon') AS month,
      SUM(total_amount) AS revenue
    FROM invoices
    GROUP BY month, DATE_TRUNC('month', created_at)
    ORDER BY DATE_TRUNC('month', created_at)
  `;

  const { rows } = await db.query(query);
  return rows;
};

const getAttendanceTrend = async () => {
  const query = `
    SELECT
      TO_CHAR(date, 'Dy') AS day,
      SUM(present_count) AS present,
      SUM(absent_count) AS absent
    FROM daily_attendance_summary
    GROUP BY day, date
    ORDER BY date
  `;

  const { rows } = await db.query(query);
  return rows;
};


const getReportPreview = async ({ reportType, fromDate, toDate }) => {
  let query = "";

  if (reportType === "Task Performance") {
    query = `
      SELECT
        tw.id AS id,
        c.name AS colo,
        'Tasks Completed' AS metric,
        COUNT(tw.completed_at) AS value,
        TO_CHAR($1::date, 'Mon YYYY') AS period
      FROM task_workers tw
      JOIN colos c ON c.id = tw.colo_id
      WHERE tw.completed_at BETWEEN $1 AND $2
      GROUP BY tw.id, c.name
      LIMIT 20
    `;
  } else {
    query = `
      SELECT
        inv.id AS id,
        'All COLOs' AS colo,
        'Revenue' AS metric,
        inv.total_amount AS value,
        TO_CHAR(inv.created_at, 'Mon YYYY') AS period
      FROM invoices inv
      WHERE inv.created_at BETWEEN $1 AND $2
      ORDER BY inv.created_at DESC
      LIMIT 20
    `;
  }

  const { rows } = await db.query(query, [fromDate, toDate]);
  return rows;
};

const getWorkerTaskSummary = async (workerId) => {

  console.log("WORKER ID:", workerId);

  const query = `
    SELECT
      COUNT(*) FILTER (WHERE status = 'Completed') AS completed,
      COUNT(*) FILTER (WHERE status != 'Completed') AS pending
    FROM task_workers
WHERE worker_id = $1
OR employee_id = $1
  `;

  console.log("QUERY RUNNING");

  const { rows } = await db.query(query, [workerId]);

  console.log("ROWS:", rows);

  return rows[0];
};


const getWorkerAttendance = async (workerId) => {

  const query = `
    SELECT
      date,
      status,
      working_hours
    FROM attendance
    WHERE worker_id = $1
    ORDER BY date DESC
  `;

  const { rows } = await db.query(query, [workerId]);

  return [
    {
      id: 1,
      date: "2026-05-20",
      status: "Present",
      working_hours: "08:30",
    },

    {
      id: 2,
      date: "2026-05-21",
      status: "Late",
      working_hours: "07:45",
    },
  ];

  
};


// 🔥 ADD NEW FUNCTION HERE
const getWorkerAttendanceSummary = async (workerId) => {

  return {
    attendance_rate: 95
  };

};
// exports.getWorkerSummary = async (req, res) => {
//   try {
//     const workerId = req.user.id; // 🔥 from token

//     const taskResult = await reportsModel.getWorkerTaskSummary(workerId);
//     const attendanceResult = await reportsModel.getWorkerAttendanceSummary(workerId);

//     res.json({
//       tasksCompleted: Number(taskResult.completed),
//       pendingTasks: Number(taskResult.pending),
//       attendanceRate: Number(attendanceResult.attendance_rate),
//     });
//   } catch (err) {
//     console.error("WORKER REPORT ERROR:", err);
//     res.status(500).json({ message: "Failed to load worker report" });
//   }
// };

const getWorkerTrend = async (workerId) => {

  const query = `
    SELECT
      assigned_at::date as day,
      COUNT(*) as completed
    FROM task_workers
    WHERE worker_id = $1
OR employee_id = $1
    GROUP BY assigned_at::date
    ORDER BY assigned_at::date
  `;

  const { rows } =
    await db.query(query, [workerId]);

  return [
    { day: "Mon", completed: 4 },
    { day: "Tue", completed: 7 },
    { day: "Wed", completed: 5 },
    { day: "Thu", completed: 8 },
    { day: "Fri", completed: 6 },
  ];
};

module.exports = {
  getTaskSummary,
  getRevenueSummary,
  getAttendanceSummary,
  getTaskCompletionByColo,
  getMonthlyRevenueTrend,
  getAttendanceTrend,
  getReportPreview,
  getWorkerTaskSummary,
  getWorkerAttendance,
  getWorkerAttendanceSummary,
  getWorkerTrend,
};

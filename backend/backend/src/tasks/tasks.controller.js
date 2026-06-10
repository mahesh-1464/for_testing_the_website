const db = require("../config/db");
const service = require("./tasks.service");

/* ================= GET TASKS ================= */
const getTasks = async (req, res) => {
  try {
    const result = await db.query(`
SELECT
    t.task_id AS id,
    t.title,
    t.assigned_to_emp_id,
    t.location_id,
    
    CASE 
      WHEN t.priority = 1 THEN 'Low'
      WHEN t.priority = 2 THEN 'Medium'
      WHEN t.priority = 3 THEN 'High'
      ELSE 'Low'
    END AS priority,

    t.status,

    t.scheduled_datetime AS "dueDate",

    l.colo,

    COUNT(tw.worker_id) AS worker_count

  FROM tasks t

  LEFT JOIN task_workers tw
    ON t.task_id = tw.task_id

  LEFT JOIN locations l
    ON t.location_id = l.id

  GROUP BY
    t.task_id,
    t.title,
    t.priority,
    t.status,
    t.scheduled_datetime,
    l.colo

  ORDER BY t.created_at DESC
`);
    res.json({ success: true, data: result.rows });

  } catch (err) {
    console.error("GET TASKS ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

/* ================= CREATE TASK ================= */
const createTask = async (req, res) => {
  const {
    title,
    description,
    priority,
    status,
    scheduled_datetime,
    location_id,
    assigned_to_emp_id,
  } = req.body;

  const priorityMap = {
    Low: 1,
    Medium: 2,
    High: 3,
  };

  try {
    const result = await db.query(
      `
      INSERT INTO tasks
      (title, description, priority, status, scheduled_datetime, location_id, assigned_to_emp_id, created_by_emp_id)
      VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
      RETURNING *
      `,
      [
        title,
        description || title,
        priorityMap[priority] || 1,
        status || "Pending",
        scheduled_datetime,
        location_id,
        assigned_to_emp_id,
        "EMP001",
      ]
    );

    res.status(201).json({
      success: true,
      data: result.rows[0],
    });
  } catch (err) {
    console.error("CREATE TASK ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

/* ================= UPDATE TASK ================= */
const updateTask = async (req, res) => {
  const { id } = req.params;
  const { title, priority, status, scheduled_datetime } = req.body;

  const priorityMap = {
    Low: 1,
    Medium: 2,
    High: 3,
  };

  try {
    await db.query(
      `
      UPDATE tasks
      SET title=$1,
          priority=$2,
          status=$3,
          scheduled_datetime=$4
      WHERE task_id=$5
      `,
      [
        title,
        priorityMap[priority] || priority,
        status,
        scheduled_datetime,
        id,
      ]
    );

    res.json({ success: true });
  } catch (err) {
    console.error("UPDATE TASK ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

/* ================= DELETE TASK ================= */
const deleteTask = async (req, res) => {
  try {
    await db.query(
      `DELETE FROM tasks WHERE task_id=$1`,
      [req.params.id]
    );
    res.json({ success: true });
  } catch (err) {
    console.error("DELETE TASK ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

/* ================= TASK SUMMARY ================= */
const getTaskSummary = async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        task_id,
        title,
        priority,
        status,
        created_at,
        scheduled_datetime,
        location_id,
        assigned_to_emp_id
      FROM tasks
      ORDER BY created_at DESC
    `);

    const stats = {
      total: 0,
      pending: 0,
      inProgress: 0,
      completed: 0,
    };

    result.rows.forEach((t) => {
      stats.total++;
      if (t.status === "Pending") stats.pending++;
      if (t.status === "In_Progress") stats.inProgress++;
      if (t.status === "Completed") stats.completed++;
    });

    res.json({
      success: true,
      stats,
      tasks: result.rows,
    });
  } catch (err) {
    console.error("TASK SUMMARY ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

/* ================= UPDATE TASK STATUS ================= */
const updateTaskStatus = async (req, res) => {
  try {
    const taskId = req.params.id;
    const { status } = req.body;

    const updatedTask = await service.updateTaskStatus(taskId, status);

    res.json({
      success: true,
      data: updatedTask,
    });

  } catch (err) {
    console.error("UPDATE ERROR:", err.message);

    res.status(400).json({
      success: false,
      message: err.message,
    });
  }
};

/* ================= GET TASKS BY WORKER ================= */
const getTasksByWorker = async (req, res) => {
  try {
    const workerId = req.params.emp_id;

    const result = await db.query(
      `
      SELECT *
      FROM tasks
      WHERE assigned_to_emp_id = $1
      ORDER BY created_at DESC
      `,
      [workerId]
    );

    res.json({
      success: true,
      data: result.rows,
    });

  } catch (err) {
    console.error("WORKER TASK ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

/* ================= ASSIGN WORKERS ================= */
const assignWorkers = async (req, res) => {
  const { task_id, worker_ids, employee_id } = req.body;

  try {
    // remove old assignments
    await db.query(
      "DELETE FROM task_workers WHERE task_id = $1",
      [task_id]
    );

    // insert new workers
    for (let workerId of worker_ids) {
      await db.query(
        `INSERT INTO task_workers (task_id, employee_id, worker_id)
         VALUES ($1, $2, $3)`,
        [task_id, employee_id, workerId]
      );
    }

    res.json({ success: true });

  } catch (err) {
    console.error("ASSIGN WORKERS ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

/* ================= GET ALL WORKERS ================= */
const getWorkers = async (req, res) => {
  try {
    const result = await db.query(
      "SELECT emp_id, username FROM users WHERE role = 'worker'"
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

/* ================= GET TASK WORKERS (NEW) ================= */
const getTaskWorkers = async (req, res) => {
  try {
    const taskId = req.params.id;

    const result = await db.query(
      `
      SELECT u.emp_id, u.username
      FROM task_workers tw
      JOIN users u ON tw.worker_id = u.emp_id
      WHERE tw.task_id = $1
      `,
      [taskId]
    );

    res.json({
      success: true,
      data: result.rows,
    });

  } catch (err) {
    console.error("GET TASK WORKERS ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};

// UPDATE WORKER STATUS
const updateWorkerTaskStatus = async (req, res) => {
  const { task_id, worker_id, status } = req.body;

  try {
    await db.query(
      `UPDATE task_workers 
       SET status = $1 
       WHERE task_id = $2 AND worker_id = $3`,
      [status, task_id, worker_id]
    );

    res.json({ success: true });

  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false });
  }
};

const checkAndUpdateTaskCompletion = async (taskId) => {
  const result = await db.query(
    `SELECT COUNT(*) 
     FROM task_workers 
     WHERE task_id = $1 AND status != 'Completed'`,
    [taskId]
  );

  if (parseInt(result.rows[0].count) === 0) {
    await db.query(
      `UPDATE tasks SET status = 'Completed' WHERE task_id = $1`,
      [taskId]
    );
  }
};

const getTaskById = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await db.query(
      `SELECT * FROM tasks WHERE task_id = $1`,
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Task not found",
      });
    }

    res.json({
      success: true,
      data: result.rows[0],
    });

  } catch (err) {
    console.error("GET TASK BY ID ERROR:", err.message);
    res.status(500).json({ success: false, error: err.message });
  }
};
/* ================= MANAGER TASK DASHBOARD ================= */
const getManagerTasks = async (req, res) => {
  try {

    const result = await db.query(`
      SELECT
        t.task_id,
        t.title,
        t.status,
        t.created_at,

        l.colo,

        u.username AS supervisor_name

      FROM tasks t

      LEFT JOIN locations l
  ON t.location_id = l.id

      LEFT JOIN users u
        ON t.assigned_to_emp_id = u.emp_id

      ORDER BY t.created_at DESC
    `);

    const formattedTasks = result.rows.map((task) => ({
      id: task.task_id,
      task: task.title,
      colo: task.colo || "Not Assigned",
      supervisor: task.supervisor_name || "Not Assigned",

      status:
        task.status === "In_Progress"
          ? "In Progress"
          : task.status,
    }));

    res.json({
      success: true,
      data: formattedTasks,
    });

  } catch (err) {

    console.error(
      "GET MANAGER TASKS ERROR:",
      err.message
    );

    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
};

/* ================= EXPORTS ================= */
module.exports = {
  getTasks,
  getTaskById,  
  createTask,
  updateTask,
  deleteTask,
  getTaskSummary,
  updateTaskStatus,
  getTasksByWorker,
  assignWorkers,
  getWorkers,
  getTaskWorkers, 
  updateWorkerTaskStatus,
  checkAndUpdateTaskCompletion,
  getManagerTasks,
};
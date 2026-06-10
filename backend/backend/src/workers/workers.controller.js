const pool = require("../config/db");
const bcrypt = require("bcrypt");

// ----------------------------------
// GET ALL WORKERS
// ----------------------------------
// exports.getWorkers = async (req, res) => {
//   try {
//     const result = await pool.query(`
//       SELECT 
//         emp_id AS id,
//         name,
//         role,
//         vendor,
//         colo,
//         hall,
//         rating,
//         CASE 
//           WHEN status = true THEN 'Active'
//           ELSE 'Inactive'
//         END AS status
//       FROM workers
//     `);

//     res.json({
//       success: true,
//       data: result.rows,
//     });
//   } catch (err) {
//     console.error(err);
//     res.status(500).json({ error: "Server error" });
//   }
// };

const getWorkers = async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT 
        emp_id AS id,
        name,
        role,
        vendor,
        colo,
        hall,
        rating,
        CASE 
          WHEN status = true THEN 'Active'
          ELSE 'Inactive'
        END AS status
      FROM workers
    `);

    res.json({
      success: true,
      data: result.rows,
    });
  } catch (error) {
    console.error("Error fetching workers:", error);
    res.status(500).json({ error: "Server error" });
  }
};

// ----------------------------------
// CREATE WORKER
// ----------------------------------
const createWorker = async (req, res) => {
  try {
    const { emp_id, username, email } = req.body;

    const passwordHash = await bcrypt.hash("worker123", 10);

    const result = await pool.query(
      `
      INSERT INTO users (emp_id, username, email, password_hash, role, is_active)
      VALUES ($1, $2, $3, $4, 'worker', true)
      RETURNING emp_id, username, email, role, is_active, created_at
      `,
      [emp_id, username, email, passwordHash]
    );

    res.json({
      success: true,
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Create worker error:", error.message);
    res.status(500).json({
      success: false,
      message: "Create worker failed",
    });
  }
};

// ----------------------------------
// UPDATE WORKER
// ----------------------------------
const updateWorker = async (req, res) => {
  try {
    const { id } = req.params;
    const { username, is_active } = req.body;

    const result = await pool.query(
      `
      UPDATE users
      SET username = $1,
          is_active = $2
      WHERE emp_id = $3
      RETURNING emp_id, username, email, role, is_active, created_at
      `,
      [username, is_active, id]
    );

    res.json({
      success: true,
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Update worker error:", error.message);
    res.status(500).json({
      success: false,
      message: "Update worker failed",
    });
  }
};
// ----------------------------------
// DELETE WORKER (SOFT DELETE)
// ----------------------------------
const deleteWorker = async (req, res) => {
  try {
    const { id } = req.params;

    const result = await pool.query(
      `
      UPDATE users
      SET is_active = false
      WHERE emp_id = $1
      RETURNING emp_id, username, email, role, is_active
      `,
      [id]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({
        success: false,
        message: "Worker not found",
      });
    }

    res.json({
      success: true,
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Delete worker error:", error.message);
    res.status(500).json({
      success: false,
      message: "Delete worker failed",
    });
  }
};

const getWorkerProfile = async (req, res) => {
  try {
    const id = req.params.id;

    const result = await pool.query(
      `
      SELECT 
        emp_id AS id,
        name,
        role,
        vendor,
        colo,
        hall,
        rating,
        status
      FROM workers
      WHERE emp_id = $1
      `,
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: "Worker not found" });
    }

    res.json(result.rows[0]);

  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: err.message });
  }
};





const getWorkerTasks = async (req, res) => {
  try {
    const employeeId = req.params.id;

    const result = await pool.query(`
      SELECT 
        task_id,
        title,
        description,
        status,
        scheduled_datetime
      FROM tasks
      WHERE assigned_to_emp_id = $1
    `, [employeeId]);

    res.json(result.rows);

  } catch (err) {
    console.error("TASK ERROR:", err.message);
    res.status(500).json({ message: err.message });
  }
};

// Update worker location
const updateLocation = async (req, res) => {
  const { emp_id, latitude, longitude } = req.body;

  try {
    await pool.query(
      `INSERT INTO worker_locations (emp_id, latitude, longitude)
       VALUES ($1, $2, $3)`,
      [emp_id, latitude, longitude]
    );

    res.json({ success: true, message: "Location updated" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update location" });
  }
};

// Get latest location
const getLocation = async (req, res) => {
  const { emp_id } = req.params;

  try {
    const result = await pool.query(
      `SELECT * FROM worker_locations
       WHERE emp_id = $1
       ORDER BY updated_at DESC
       LIMIT 1`,
      [emp_id]
    );

    res.json(result.rows[0] || {});
  } catch (err) {
    res.status(500).json({ error: "Failed to fetch location" });
  }
};

// exports.getWorkersBySupervisor = async (req, res) => {
//   const { supervisor_id } = req.params;

//   try {
//     const [rows] = await pool.query(
//       `SELECT id, name, role, vendor, colo, hall, status, rating 
//        FROM users 
//        WHERE supervisor_id = ? AND role = 'Worker'`,
//       [supervisor_id]
//     );

//     res.json(rows);
//   } catch (err) {
//     console.error("Error fetching workers:", err);
//     res.status(500).json({ message: "Server error" });
//   }
// };

exports.updateWorker = async (req, res) => {
  const { id } = req.params;
  const { hall, status, rating } = req.body;

  try {
    await pool.query(
      `UPDATE users SET hall = ?, status = ?, rating = ? WHERE id = ?`,
      [hall, status, rating, id]
    );

    res.json({ message: "Worker updated successfully" });
  } catch (err) {
    console.error("Update error:", err);
    res.status(500).json({ message: "Update failed" });
  }
};

/* ================= GET WORKERS BY SUPERVISOR ================= */
const getWorkersBySupervisor = async (req, res) => {
  try {
    const { supervisor_id } = req.params;

    const result = await pool.query(
      `SELECT emp_id, username, role
       FROM users
       WHERE supervisor_id = $1 AND role = 'worker'`,
      [supervisor_id]
    );

    res.json(result.rows);

  } catch (err) {
    console.error("SUPERVISOR WORKERS ERROR:", err.message);
    res.status(500).json({ error: err.message });
  }
};

// ----------------------------------
// EXPORTS (VERY IMPORTANT)
// ----------------------------------
module.exports = {
  getWorkers, 
  createWorker,
  updateWorker,
  deleteWorker,
  getWorkerProfile,
  getWorkerTasks,
  updateLocation,
  getLocation,
  updateWorker,
  getWorkersBySupervisor,
};
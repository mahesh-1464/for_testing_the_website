const pool = require("../config/db"); 
const { get } = require("./users.routes");

const getUsers = async (req, res) => {
  try {

    const result = await pool.query(`
      SELECT
        emp_id,
        username AS name,
        email,
        role,
        colo,
        is_active,
        created_at
      FROM users
      ORDER BY created_at DESC
    `);

    res.json({
      success: true,
      data: result.rows,
    });

  } catch (error) {

    console.error("FULL ERROR:", error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

const getUserProfile = async (req, res) => {
  try {
    const id = req.params.emp_id;

    const result = await pool.query(
      `SELECT 
        emp_id,
        username,
        role,
        email
       FROM users 
       WHERE emp_id = $1`,
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "User not found",
      });
    }

    res.json({
      success: true,
      data: result.rows[0],
    });

  } catch (error) {
    console.error("Error fetching profile:", error.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};


const getUsername  = async (req, res) => {
  try {
    const username = req.params.username;

const result = await pool.query(
  "SELECT username, role, colo FROM users WHERE username = $1",
  [username]
);

    res.json({
      success: true,
      data: result.rows[0],
    });

    

  } catch (error) {
    console.error("Error fetching profile:", error.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};


const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const loginUser = async (req, res) => {
  try {
    const { email, password } = req.body;

    console.log("LOGIN INPUT:", email, password);

    // ✅ First get data from DB
    const result = await pool.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    // ✅ Now it's safe to log
    console.log("DB RESULT:", result.rows);

    if (result.rows.length === 0) {
      return res.status(401).json({
        success: false,
        message: "Invalid email or password",
      });
    }

    const user = result.rows[0];

    // 2. Compare password
    const isMatch = await bcrypt.compare(password, user.password_hash);

        console.log("PASSWORD MATCH:", isMatch);
    if (!isMatch) {
      return res.status(401).json({
        success: false,
        message: "Invalid email or password",
      });
    }

    // 3. Generate token
    const token = jwt.sign(
      {
        id: user.emp_id,
        role: user.role,
      },
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    // 4. Send response
    res.json({
      success: true,
      token,
      user: {
        emp_id: user.emp_id,
        username: user.username,
        role: user.role,
      },
    });

  } catch (error) {
    console.error("Login error:", error.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

const getSupervisorProfile = async (req, res) => {
  try {
    const supervisorId = req.user.id; // from JWT
    console.log("SUPERVISOR ID FROM TOKEN:", supervisorId);

const result = await pool.query(
  `SELECT 
    emp_id as id,
    username as name,
    role,
    email as phone,
    colo,
    CASE 
      WHEN is_active = true THEN 'Active'
      ELSE 'Inactive'
    END as status,

    COALESCE(
      TO_CHAR(created_at, 'YYYY-MM-DD'),
      TO_CHAR(NOW(), 'YYYY-MM-DD')
    ) as "lastAttendance"

   FROM users
   WHERE LOWER(TRIM(role)) = 'worker'
   AND LOWER(TRIM(supervisor_id)) = LOWER(TRIM($1))`,
  [supervisorId]
);
    res.json({
      success: true,
      data: result.rows[0],
    });

  } catch (error) {
    console.error("Supervisor profile error:", error);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

const getSupervisorHelpers = async (req, res) => {
  try {
    const supervisorId = String(req.user.id).trim();

    console.log("REQ.USER:", req.user);
    console.log("SUPERVISOR ID:", supervisorId);

    const result = await pool.query(
      `SELECT 
        emp_id as id,
        username as name,
        role,
        email as phone,
        colo,
        CASE 
          WHEN is_active = true THEN 'Active'
          ELSE 'Inactive'
        END as status,
        created_at as lastAttendance
       FROM users
       WHERE LOWER(TRIM(role)) = 'worker'
       AND LOWER(TRIM(supervisor_id)) = LOWER(TRIM($1))`,
      [supervisorId]
    );

    res.json({
      success: true,
      data: result.rows,
    });

  } catch (error) {
    console.error("Helpers fetch error:", error);

    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};


const getWorkers = async (req, res) => {
  try {

const result = await pool.query(`
  SELECT
    emp_id AS id,
    username AS name,
    email,
    role,
    colo,
    is_active AS status
  FROM users
  WHERE LOWER(TRIM(role)) IN ('worker', 'supervisor')
  ORDER BY created_at DESC
`);
const formattedWorkers = result.rows.map((user) => ({
  emp_id: user.id,
  name: user.name,
  email: user.email,
  role: user.role,
  vendor: "InService",
  colo: user.colo || "Not Assigned",
  hall: user.hall || "N/A",
  rating: 4.0,
  status: user.status ? "Active" : "Inactive",
}));

    res.json({
      success: true,
      data: formattedWorkers,
    });

  } catch (error) {

    console.error("GET WORKERS ERROR:", error);

    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};


const updateWorker = async (req, res) => {
  try {

    const { emp_id } = req.params;

    const {
      username,
      email,
      role,
      colo,
      is_active,
    } = req.body;

    // CHECK USER EXISTS
    const existingUser = await pool.query(
      "SELECT * FROM users WHERE emp_id = $1",
      [emp_id]
    );

    if (existingUser.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Worker not found",
      });
    }

    // UPDATE USER
    const result = await pool.query(
      `
      UPDATE users
      SET
        username = $1,
        email = $2,
        role = $3,
        colo = $4,
        is_active = $5
      WHERE emp_id = $6
      RETURNING
        emp_id,
        username,
        email,
        role,
        colo,
        is_active
      `,
      [
        username,
        email,
        role,
        colo,
        is_active,
        emp_id,
      ]
    );

    res.json({
      success: true,
      message: "Worker updated successfully",
      data: result.rows[0],
    });

  } catch (error) {

    console.error("UPDATE WORKER ERROR:", error);

    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

exports.signup = async (req, res) => {
  const { name, email, phone, password } = req.body;

  try {
    const hashedPassword = await bcrypt.hash(password, 10);

const result = await pool.query(
  `INSERT INTO users (emp_id, username, email, password_hash, role)
   VALUES ($1, $2, $3, $4, $5)
   RETURNING *`,
  [
    "EMP" + Date.now(),   // ✅ generate unique emp_id
    name,
    email,
    hashedPassword,
    "worker"
  ]
);

    res.json({
      message: "User created successfully",
      user: result.rows[0],
    });

  } catch (err) {
    console.error("SIGNUP ERROR:", err.message);
    res.status(500).json({ error: err.message });
  }
};

const createWorker = async (req, res) => {
  try {

    const {
      username,
      email,
      password,
      role,
      colo,
    } = req.body;

    // CHECK EXISTING EMAIL
    const existingUser = await pool.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    if (existingUser.rows.length > 0) {
      return res.status(400).json({
        success: false,
        message: "Email already exists",
      });
    }

   

    // HASH PASSWORD
    const hashedPassword = await bcrypt.hash(password, 10);

    // GENERATE EMPLOYEE ID
    const empId = "EMP" + Date.now();

    // INSERT USER
    const result = await pool.query(
      `
      INSERT INTO users (
        emp_id,
        username,
        email,
        password_hash,
        role,
        colo,
        is_active
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7)
      RETURNING *
      `,
      [
        empId,
        username,
        email,
        hashedPassword,
        role || "worker",
        colo,
        true,
      ]
    );

    res.status(201).json({
      success: true,
      message: "Worker created successfully",
      data: result.rows[0],
    });

  } catch (error) {

    console.error("CREATE WORKER ERROR:", error);

    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

 const deleteWorker = async (req, res) => {
  try {

    const { emp_id } = req.params;

    // CHECK USER EXISTS
    const existingUser = await pool.query(
      "SELECT * FROM users WHERE emp_id = $1",
      [emp_id]
    );

    if (existingUser.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Worker not found",
      });
    }

    // DELETE USER
    await pool.query(
      "DELETE FROM users WHERE emp_id = $1",
      [emp_id]
    );

    res.json({
      success: true,
      message: "Worker deleted successfully",
    });

  } catch (error) {

    console.error("DELETE WORKER ERROR:", error);

    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

const getWorkersDashboard = async (req, res) => {
  try {

    const result = await pool.query(`
      SELECT
        emp_id,
        username AS name,
        role,
        colo,
        supervisor_id,
        is_active
      FROM users
      WHERE LOWER(TRIM(role)) IN ('worker', 'supervisor')
      ORDER BY created_at DESC
    `);

const formattedWorkers = result.rows.map((worker) => ({
  emp_id: worker.emp_id,
  name: worker.name,
  role: worker.role,
  colo: worker.colo || "Not Assigned",
  supervisor: "Not Assigned",
  status: worker.is_active ? "Active" : "Inactive",
  attendancePercentage: Math.floor(Math.random() * 20) + 80,
}));

    res.json({
      success: true,
      data: formattedWorkers,
    });

  } catch (error) {
    console.error("GET WORKERS DASHBOARD ERROR:", error);

    res.status(500).json({
      success: false,
      message: "Failed to fetch workers dashboard",
    });
  }
};

module.exports = {
  getUsers,
  getUserProfile,
  getUsername,
  signup: exports.signup,
  getSupervisorProfile,
  getSupervisorHelpers,
  getWorkers,
  loginUser,
  createWorker,
  updateWorker,
  deleteWorker,
  getWorkersDashboard,
};

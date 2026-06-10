const express = require("express");
const router = express.Router();
const pool = require("../config/db");


// ✅ GET PROFILE
router.get("/profile/:id", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT * FROM users WHERE id = $1",
      [req.params.id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "User not found",
      });
    }

    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


// ✅ UPDATE PROFILE
router.put("/profile/:id", async (req, res) => {
  try {
    const { phone, location } = req.body;

     console.log("Requested ID:", req.params.id); // 👈 ADD THIS
      console.log("Phone:", phone); // 👈 ADD THIS
    const result = await pool.query(
      `UPDATE users 
       SET phone = $1, location = $2 
       WHERE emp_id = $3 
       RETURNING *`,
      [phone, location, req.params.id]
    );


    console.log("DB Result:", result.rows); // 👈 ADD THIS

    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


// ✅ CHANGE PASSWORD
router.put("/change-password/:id", async (req, res) => {
  try {
    const { password } = req.body;

    await pool.query(
      "UPDATE users SET password_hash = $1 WHERE emp_id = $2",
      [password, req.params.id]
    );

    res.json({ message: "Password updated" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
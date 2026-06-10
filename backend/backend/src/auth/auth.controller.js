const crypto = require("crypto");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const db = require("../config/db");



// ================= LOGIN =================

const login = async (req, res) => {
  try {

    const { email, password } = req.body;

    // ✅ Check user
    const result = await db.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    const users = result.rows;

    if (users.length === 0) {
      return res.status(401).json({
        message: "Invalid email"
      });
    }

    const user = users[0];

    // ✅ Compare password
const isMatch = await bcrypt.compare(
  password,
  user.password_hash
);

    if (!isMatch) {
      return res.status(401).json({
        message: "Invalid password"
      });
    }

    // ✅ Generate JWT Token
    const token = jwt.sign(
      {
        id: user.id,
        email: user.email,
        role: user.role,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: "1d",
      }
    );

    // ✅ Success Response
    res.json({
      message: "Login successful",
      token,
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role,
      },
    });

  } catch (err) {

    console.error("LOGIN ERROR:", err);

    res.status(500).json({
      error: err.message
    });
  }
};
// ================= FORGOT PASSWORD =================
const forgotPassword = async (req, res) => {
  try {
    console.log("FORGOT PASSWORD HIT:", req.body);

    const { email } = req.body;

    // ✅ PostgreSQL query
    const result = await db.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    const user = result.rows;

    // ✅ User check
    if (user.length === 0) {
      return res.status(404).json({
        message: "User not found"
      });
    }

    // ✅ Generate token
    const token = crypto.randomBytes(32).toString("hex");

    // ✅ Expiry
    const expiry = Date.now() + 15 * 60 * 1000;

    // ✅ Save token
    await db.query(
      "UPDATE users SET reset_token = $1, reset_token_expiry = $2 WHERE email = $3",
      [token, expiry, email]
    );

    // ✅ Reset link
    const resetLink = `http://localhost:3000/reset-password/${token}`;

    console.log("RESET LINK:", resetLink);

    res.json({
      message: "Reset link sent",
      resetLink
    });

  } catch (err) {
    console.error("FORGOT PASSWORD ERROR:", err);

    res.status(500).json({
      error: err.message
    });
  }
};


// ================= RESET PASSWORD =================
const resetPassword = async (req, res) => {
  try {

    const { token } = req.params;
    const { password } = req.body;

    // ✅ Find token
    const result = await db.query(
      "SELECT * FROM users WHERE reset_token = $1",
      [token]
    );

    const user = result.rows;

    if (user.length === 0) {
      return res.status(400).json({
        message: "Invalid token"
      });
    }

    const dbUser = user[0];

    // ✅ Check expiry
    if (Date.now() > dbUser.reset_token_expiry) {
      return res.status(400).json({
        message: "Token expired"
      });
    }

    // ✅ Hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // ✅ Update password
    await db.query(
      `UPDATE users 
       SET password = $1,
           reset_token = NULL,
           reset_token_expiry = NULL
       WHERE id = $2`,
      [hashedPassword, dbUser.id]
    );

    res.json({
      message: "Password reset successful"
    });

  } catch (err) {

    console.error("RESET PASSWORD ERROR:", err);

    res.status(500).json({
      error: err.message
    });
  }
};

module.exports = {
  login,
  forgotPassword,
  resetPassword
};
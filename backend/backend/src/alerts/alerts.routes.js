const express = require("express");
const router = express.Router();
const db = require("../config/db");
const authenticateToken = require("../middleware/auth.middleware");

// GET ALL ALERTS
router.get("/", authenticateToken, async (req, res) => {
  try {
// const result = await db.query(`
//   SELECT
//     notification_id AS id,
//     title,
//     message,
//     recipient_role,
//     joining_id,
//     notification_id AS id,
// created_at AS date,
//     CASE WHEN is_read THEN 'Read' ELSE 'Unread' END AS status,
//     created_at AS date
//   FROM notifications
//   ORDER BY created_at DESC
//   LIMIT 50
// `);
const result = await db.query(`
  SELECT
    alert_id AS id,
    title,
    message,
    severity,
    status,
    created_by,
    created_at AS date
  FROM alerts
  ORDER BY created_at DESC
  LIMIT 50
`);

    res.json(result.rows);
  } catch (error) {
    console.error("ALERT FETCH ERROR:", error);
    res.status(500).json({ message: "Failed to fetch alerts" });
  }
});

// MARK ALERT AS READ
router.put("/read/:id", authenticateToken, async (req, res) => {
  try {
    await db.query(
      `UPDATE alerts SET is_read = TRUE WHERE alert_id = $1`,
      [req.params.id]
    );

    res.json({ message: "Alert marked as read" });
  } catch (error) {
    console.error("MARK READ ERROR:", error);
    res.status(500).json({ message: "Failed to mark alert as read" });
  }
});

// SEND ALERT (Worker → Supervisor)
router.post("/send", authenticateToken, async (req, res) => {
  try {
    // const { title, message } = req.body;
const {
  title,
  message,
  type
} = req.body;
    const result = await db.query(
      `INSERT INTO notifications 
       (title, message, recipient_role, is_read, created_at) 
       VALUES ($1, $2, 'SUPERVISOR', FALSE, NOW())
       RETURNING *`,
      [title, message]
    );

    res.json(result.rows[0]);
  } catch (error) {
    console.error("SEND ALERT ERROR:", error);
    res.status(500).json({ message: error.message });
  }
});



router.post("/reply", authenticateToken, async (req, res) => {
  try {
    const { title, message, recipient_id } = req.body;

    if (!recipient_id) {
      return res.status(400).json({ message: "Recipient ID missing" });
    }

    const result = await db.query(
      `INSERT INTO notifications 
       (title, message, joining_id, recipient_role, is_read, created_at)
       VALUES ($1, $2, $3, 'USER', FALSE, NOW())
       RETURNING *`,
      [title, message, recipient_id]
    );

    res.json(result.rows[0]);
  } catch (error) {
    console.error("REPLY ERROR:", error);
    res.status(500).json({ message: error.message });
  }
});

router.delete("/:id", authenticateToken, async (req, res) => {
  try {
    await db.query(
      `DELETE FROM alerts WHERE alert_id = $1`,
      [req.params.id]
    );

    res.json({ message: "Alert deleted" });
  } catch (error) {
    console.error("DELETE ERROR:", error);
    res.status(500).json({ message: "Failed to delete alert" });
  }
});

module.exports = router;
 
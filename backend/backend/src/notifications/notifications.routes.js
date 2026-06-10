const express = require("express");
const router = express.Router();
const db = require("../config/db");
const authenticateToken = require("../middleware/auth.middleware");

/**
 * GET ALL NOTIFICATIONS
 * GET /api/alerts
 */
// 
router.get("/", authenticateToken, async (req, res) => {
  try {
    const userRole = req.user.role; // from JWT
    const userColo = req.user.colo; // optional (if supervisor scoped)

    let query = `
      SELECT
        notification_id,
        title,
        message,
        redirect_url,
        is_read,
        created_at
      FROM notifications
      WHERE recipient_role = $1
      ORDER BY created_at DESC
      LIMIT 50
    `;

    const result = await db.query(query, [userRole]);

    res.json(result.rows);
  } catch (error) {
    console.error("NOTIFICATION FETCH ERROR:", error);
    res.status(500).json({ message: "Failed to fetch notifications" });
  }
});


/**
 * MARK NOTIFICATION AS READ
 * PUT /api/alerts/read/:id
 */
router.put("/read/:id", authenticateToken, async (req, res) => {
  try {
    await db.query(
      `UPDATE notifications SET is_read = true WHERE notification_id = $1`,
      [req.params.id]
    );

    res.json({ message: "Notification marked as read" });
  } catch (error) {
    console.error("MARK READ ERROR:", error);
    res.status(500).json({ message: "Failed to mark notification as read" });
  }
});

module.exports = router;

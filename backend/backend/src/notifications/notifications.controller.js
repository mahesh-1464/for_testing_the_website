const db = require("../config/db");

exports.getNotifications = async (req, res) => {
  try {
    const result = await db.query(
      `
      SELECT id, title, message, redirect_url, created_at
      FROM notifications
      WHERE recipient_role = $1
      ORDER BY created_at DESC
      LIMIT 10
      `,
      [req.user.role]
    );

    res.json(result.rows);
  } catch (err) {
    console.error("FETCH NOTIFICATIONS ERROR", err);
    res.status(500).json({ message: "Failed to fetch notifications" });
  }
};

exports.markAsRead = async (req, res) => {
  try {
    await db.query(
      "UPDATE notifications SET is_read = true WHERE id = $1",
      [req.params.id]
    );
    res.json({ message: "Notification marked as read" });
  } catch (err) {
    console.error("MARK READ ERROR", err);
    res.status(500).json({ message: "Failed to mark as read" });
  }
};

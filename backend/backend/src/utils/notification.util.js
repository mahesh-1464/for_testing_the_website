const db = require("../config/db");

const createNotification = async ({
  title,
  message,
  recipient_role,
  redirect_url
}) => {
  await db.query(
    `
    INSERT INTO notifications
    (title, message, recipient_role, redirect_url)
    VALUES ($1, $2, $3, $4)
    `,
    [title, message, recipient_role, redirect_url]
  );
};

module.exports = { createNotification };

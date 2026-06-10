const db = require("../config/db");

const getPaymentManagement = async (req, res) => {
  try {

    const result = await db.query(`
      SELECT *
      FROM payment_management
      ORDER BY created_at DESC
    `);

    res.status(200).json(result.rows);

  } catch (error) {

    console.error(error);

    res.status(500).json({
      message: "Server Error",
    });
  }
};

module.exports = {
  getPaymentManagement,
};
const db = require("../config/db");

// GET all suggestions
const getSuggestions = async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM suggestions ORDER BY id DESC");
    res.json(result.rows);
  } catch (err) {
    console.error("SUGGESTIONS ERROR:", err.message);
    res.status(500).json({ error: err.message });
  }
};

// ADD suggestion (Admin)
const addSuggestion = async (req, res) => {
  try {
    const { title, source, status, impact } = req.body;

    await db.query(
      "INSERT INTO suggestions (title, source, status, impact) VALUES ($1,$2,$3,$4)",
      [title, source, status, impact]
    );

    res.json({ message: "Suggestion added" });
  } catch (err) {
    console.error("ADD ERROR:", err.message);
    res.status(500).json({ error: err.message });
  }
};

module.exports = { getSuggestions, addSuggestion };
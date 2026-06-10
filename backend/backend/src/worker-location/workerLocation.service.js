const db = require("../config/db");

exports.updateWorkerLocation = async (workerId, lat, lng) => {
  const { rows } = await db.query(
    `
    INSERT INTO worker_live_location (worker_id, latitude, longitude, updated_at)
    VALUES ($1, $2, $3, NOW())
    ON CONFLICT (worker_id)
    DO UPDATE SET
      latitude = EXCLUDED.latitude,
      longitude = EXCLUDED.longitude,
      updated_at = NOW()
    RETURNING *
    `,
    [workerId, lat, lng]
  );

  return rows[0];
};

exports.getWorkerLocation = async (req, res) => {
  try {
    const data = await service.getWorkerLocation();
    res.json(data);
  } catch (err) {
    console.error("TRACK ERROR:", err.message);
    res.status(500).json({ error: "Failed to fetch locations" });
  }
};

// exports.getAllWorkersLocation = async () => {
//   const { rows } = await db.query(
//     `
//     SELECT worker_id, latitude AS lat, longitude AS lng, updated_at
//     FROM worker_live_location
//     `
//   );

//   return rows;
// };
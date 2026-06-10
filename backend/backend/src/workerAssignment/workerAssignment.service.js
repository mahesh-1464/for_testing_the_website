const db = require("../config/db");

exports.assignWorker = async (workerId, locationId) => {
  const { rows } = await db.query(
    `
    INSERT INTO worker_location (worker_id, location_id)
    VALUES ($1, $2)
    ON CONFLICT (worker_id)
    DO UPDATE SET
      location_id = EXCLUDED.location_id,
      updated_at = NOW()
    RETURNING *;
    `,
    [workerId, locationId]
  );

  return rows[0];
};

exports.getAllAssignments = async () => {
  const { rows } = await db.query(
    `SELECT worker_id, location_id FROM worker_location`
  );
  return rows;
};
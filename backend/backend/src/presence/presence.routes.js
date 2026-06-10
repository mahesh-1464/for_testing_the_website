const express = require("express");

const router = express.Router();

const pool = require("../config/db");

const pointInPolygon = require("point-in-polygon");

// 🔶 Your Polygon Coordinates
const polygon = [
  [17.190614, 78.505090],
  [17.190678, 78.503525],
  [17.190666, 78.504246],
  [17.189687, 78.503955],
];

router.get("/", async (req, res) => {

  try {

    const result = await pool.query(
      `
      SELECT DISTINCT ON (worker_id)
        worker_id AS employee_id,
        latitude AS lat,
        longitude AS lng,
        updated_at
      FROM worker_locations
      ORDER BY worker_id, updated_at DESC
      `
    );

    const workers = result.rows.map((worker) => {

      const inside = pointInPolygon(
        [worker.lat, worker.lng],
        polygon
      );

      return {
        ...worker,
        status: inside
          ? "inside"
          : "outside",
      };
    });

    res.json(workers);

  } catch (err) {

    console.error(err);

    res.status(500).json({
      error: "Failed to fetch live workers",
    });
  }
});

module.exports = router;
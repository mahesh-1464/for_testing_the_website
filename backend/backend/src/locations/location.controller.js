// src/locations/location.controller.js
const service = require("./location.service");

const pool = require("../config/db");

exports.getLocations = async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM location");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch locations" });
  }
};

const getAllLocations = async (req, res) => {
  try {
    const data = await service.getAllLocations();
    res.json(data);
  } catch (err) {
  console.error("LOCATION DETAIL ERROR:", err.message);
  res.status(500).json({
    message: "Failed to fetch location detail",
    error: err.message
  });
}

};

const getLocationById = async (req, res) => {
  try {
    const data = await service.fetchLocationDetail(req.params.id);
    if (!data) {
      return res.status(404).json({ message: "Location not found" });
    }
    res.json(data);
  } catch (err) {
  console.error("LOCATION DETAIL ERROR:", err.message);
  res.status(500).json({
    message: "Failed to fetch location detail",
    error: err.message
  });
}

};

const updateLocation = async (req, res) => {
  try {
    const updated = await service.updateLocation(req.params.id, req.body);
    res.json(updated);
  } catch (err) {
  console.error("LOCATION DETAIL ERROR:", err.message);
  res.status(500).json({
    message: "Failed to fetch location detail",
    error: err.message
  });
}

};

const getWorkerLocation = async (req, res) => {
  try {
    const { workerId } = req.params;

    const data = await service.getWorkerLocation(workerId);

    if (!data) {
      return res.status(404).json({ message: "Worker location not found" });
    }

    res.json(data);
  } catch (err) {
    console.error("TRACK ERROR:", err.message);
    res.status(500).json({
      message: "Failed to fetch worker location",
      error: err.message,
    });
  }
};

const updateWorkerLocation = async (req, res) => {
  try {
    const data = await service.updateWorkerLocation(req.body);
    res.json(data);
  } catch (err) {
    console.error("UPDATE WORKER LOCATION ERROR:", err.message);
    res.status(500).json({
      message: "Failed to update worker location",
      error: err.message,
    });
  }
};

exports.getAllWorkerLocations = async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT worker_id, lat, lng, updated_at FROM worker_live_location"
    );

    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch worker locations" });
  }
};



const getAllWorkerLocations = async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT worker_id, latitude AS lat, longitude AS lng, updated_at FROM worker_live_location"
    );

    res.json(result.rows);
  } catch (err) {
    console.error("Error fetching worker locations:", err);
    res.status(500).json({ error: "Failed to fetch worker locations" });
  }
};

const saveViolation = async (req, res) => {
  const { workerId, lat, lng } = req.body;

  try {
    await pool.query(
      `INSERT INTO worker_violations (worker_id, lat, lng)
       VALUES ($1, $2, $3)`,
      [workerId, lat, lng]
    );

    res.json({ message: "Violation saved" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to save violation" });
  }
};

module.exports = {
  getAllLocations,
  getLocationById,
  updateLocation,
  getWorkerLocation,
  updateWorkerLocation,
  getAllWorkerLocations,
  saveViolation,
};

const service = require("./workerLocation.service");

exports.updateLocation = async (req, res) => {
  try {
    const { workerId, lat, lng } = req.body;

    const data = await service.updateWorkerLocation(workerId, lat, lng);
    res.json(data);
  } catch (err) {
    console.error("WORKER LOCATION ERROR:", err.message);
    res.status(500).json({ message: "Failed to update worker location" });
  }
};

exports.getAllWorkerLocations = async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT id, name, lat, lng FROM workers WHERE lat IS NOT NULL AND lng IS NOT NULL"
    );

    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch locations" });
  }
};

exports.getLocation = async (req, res) => {
  try {
    const data = await service.getWorkerLocation(req.params.workerId);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: "Failed to fetch worker location" });
  }
};

exports.getAll = async (req, res) => {
  try {
    const data = await service.getAllWorkersLocation();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: "Failed to fetch workers" });
  }
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
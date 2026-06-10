const service = require("./workerAssignment.service");

exports.assign = async (req, res) => {
  const { workerId, locationId } = req.body;
  const data = await service.assignWorker(workerId, locationId);
  res.json(data);
};

exports.getAll = async (req, res) => {
  const data = await service.getAllAssignments();
  res.json(data);
};
const express = require("express");
const router = express.Router();
// const workersController = require("./workers.controller");  
const {
  getWorkers,
  createWorker,
  updateWorker,
  deleteWorker,
  getWorkerProfile,
  getWorkerTasks,
  updateLocation,
  getLocation,

} = require("./workers.controller");

const controller = require("./workers.controller");

router.get("/", getWorkers);
// router.post("/", createWorker);
router.put("/:id", updateWorker);
router.delete("/:id", deleteWorker);
router.get("/profile/:id", getWorkerProfile);
router.get("/:id/tasks", getWorkerTasks);
// router.post("/", updateLocation);
router.get("/:emp_id", getLocation);
router.get("/supervisor/:supervisor_id/workers", controller.getWorkersBySupervisor);
router.put("/workers/:id", controller.updateWorker);
router.get("/supervisor/:supervisor_id/workers", controller.getWorkersBySupervisor);
router.post("/", createWorker);
router.post("/location", updateLocation);
router.get("/location/:emp_id", getLocation);

module.exports = router;

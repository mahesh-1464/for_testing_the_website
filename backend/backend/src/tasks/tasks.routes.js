const express = require("express");
const router = express.Router();

const controller = require("./tasks.controller");
// const {
//   getTasks,
//   updateTask,
// } = require("../controllers/tasks.controller");

/* TASK ROUTES */
router.get("/", controller.getTasks);
router.post("/", controller.createTask);
router.put("/:id", controller.updateTask);
router.delete("/:id", controller.deleteTask);
router.get("/worker/:emp_id", controller.getTasksByWorker);
router.post("/assign-workers", controller.assignWorkers);
router.get("/:id/workers", controller.getTaskWorkers);
router.put("/worker/status", controller.updateWorkerTaskStatus);
// router.get("/supervisor/:supervisor_id/workers", controller.getWorkers);
router.get(
  "/supervisor/:supervisor_id/workers",
  controller.getWorkers
);

router.get(
  "/manager-dashboard",
  controller.getManagerTasks
);

/* TASK SUMMARY */
router.get("/summary", controller.getTaskSummary);

router.get("/:id", controller.getTaskById);

/* UPDATE TASK STATUS (GPS BLOCKED COMPLETION) */
router.put("/:id/status", controller.updateTaskStatus);



module.exports = router;

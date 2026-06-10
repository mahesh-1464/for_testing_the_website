const express = require("express");
const router = express.Router();
const controller = require("./workerLocation.controller");

router.post("/update", controller.updateLocation);
router.get("/:workerId", controller.getLocation);
router.get("/", controller.getAll);
router.get("/worker-location", controller.getWorkerLocation);
router.get("/locations", controller.getAllWorkerLocations);
module.exports = router;
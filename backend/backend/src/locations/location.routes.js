const express = require("express");
const router = express.Router();
const controller = require("./location.controller");

// ✅ Static routes first


router.post("/update", controller.updateLocation);
router.get("/track/all", controller.getAllWorkerLocations);
router.get("/track/:workerId", controller.getWorkerLocation);
router.post("/worker/update", controller.updateWorkerLocation);
router.get("/", controller.getAllLocations);
router.post("/violation", controller.saveViolation);
// ✅ Dynamic routes at bottom

router.patch("/:id", controller.updateLocation);
router.get("/:id", controller.getLocationById);
module.exports = router;
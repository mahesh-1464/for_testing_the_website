const express = require("express");
const router = express.Router();
const {
  getUsers,
  getWorkers,
} = require("./users.controller"); // this line imports the getUsers function from the users.controller.js file, which is used in the route below to handle requests for fetching all users.


const { signup } = require("./users.controller");
const usersController = require("./users.controller");  // this ;line calls for the getUserProfile function from the users.controller.js file, which is used in the route below to handle requests for user profiles.
const verifyToken = require("../middleware/auth.middleware");
router.post("/signup", signup);
router.get("/", getUsers);
router.get("/workers", verifyToken, getWorkers);
router.get("/profile/:emp_id", usersController.getUserProfile);
router.get("/username/:username", usersController.getUsername);
router.post("/login", usersController.loginUser);
// router.get("/supervisor/profile", usersController.getSupervisorProfile);
// router.get("/supervisor/helpers", usersController.getSupervisorHelpers);
router.get("/supervisor/profile", verifyToken, usersController.getSupervisorProfile);
router.get("/supervisor/helpers", verifyToken, usersController.getSupervisorHelpers);
router.post(
  "/create-worker",
  verifyToken,
  usersController.createWorker
);

router.put(
  "/:emp_id",
  verifyToken,
  usersController.updateWorker
);

router.delete(
  "/:emp_id",
  verifyToken,
  usersController.deleteWorker
);

router.get(
  "/workers-dashboard",
  verifyToken,
  usersController.getWorkersDashboard
);
module.exports = router;

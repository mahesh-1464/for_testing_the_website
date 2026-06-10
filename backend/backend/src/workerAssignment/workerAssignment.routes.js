const router = require("express").Router();
const controller = require("./workerAssignment.controller");

router.post("/assign", controller.assign);
router.get("/", controller.getAll);

module.exports = router;
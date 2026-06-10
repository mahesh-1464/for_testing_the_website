const express = require("express");

const router = express.Router();

const {
  getAllIssues,
  updateIssueStatus,
} = require("./issues.controller");

/* ================= ROUTES ================= */

router.get("/", getAllIssues);

router.put("/:id/status", updateIssueStatus);

module.exports = router;
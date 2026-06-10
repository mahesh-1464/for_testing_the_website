const express = require("express");
const router = express.Router();

const authenticateToken = require("../middleware/auth.middleware");
const authorizeRoles = require("../middleware/authorizeRoles.middleware");

const controller = require("./feedback.controller");
//const { getWorkerFeedback } = require("./feedback.controller");

// ---------------- WORKER FEEDBACK ----------------
router.get(
  "/worker",
  authenticateToken,
  controller.getWorkerFeedback
);

router.get(
  "/worker/:id",
  authenticateToken,
  controller.getWorkerFeedbackById
);

router.post(
  "/worker",
  authenticateToken,
  authorizeRoles("Supervisor", "Admin"),
  controller.submitWorkerFeedback
);

// ---------------- SUGGESTIONS ----------------
router.get(
  "/suggestions",
  authenticateToken,
  controller.getSuggestions
);

router.get(
  "/suggestions/:id",
  authenticateToken,
  controller.getSuggestionById
);

router.put(
  "/suggestions/:id/status",
  authenticateToken,
  authorizeRoles("Admin"),
  controller.updateSuggestionStatus
);

// ---------------- EXPORTS ----------------
router.get(
  "/export",
  authenticateToken,
  authorizeRoles("Admin"),
  controller.exportFeedbackExcel
);

router.get(
  "/export-pdf",
  authenticateToken,
  authorizeRoles("Admin"),
  controller.exportFeedbackPDF
);

// ---------------- AUDIT ----------------
router.get(
  "/suggestions/:id/audit",
  authenticateToken,
  authorizeRoles("Admin", "Manager"),
  controller.getSuggestionAudit
);

//router.get("/", getWorkerFeedback);

//router.get("/worker", controller.getWorkerFeedback);
//router.get("/suggestions", controller.getSuggestions);
module.exports = router;

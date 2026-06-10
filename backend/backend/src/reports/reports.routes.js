const express = require("express");
const router = express.Router();

const authenticateToken = require("../middleware/auth.middleware");
const authorizeRoles = require("../middleware/authorizeRoles.middleware");
const reportsController = require("./reports.controller");

// SUMMARY
router.get(
  "/summary",
  authenticateToken,
  authorizeRoles("Admin", "Manager", "Supervisor", "Worker"),
  reportsController.getSummary
);

router.get(
  "/worker-summary",
  authenticateToken,
  authorizeRoles("worker", "manager"),
  reportsController.getWorkerSummary
);
// TASKS BY COLO
router.get(
  "/tasks-by-colo",
  authenticateToken,
  authorizeRoles("Admin", "Manager"),
  reportsController.getTaskCompletionByColo
);

router.get(
  "/monthly-revenue",
  authenticateToken,
  authorizeRoles("Admin", "Manager"),
  reportsController.getMonthlyRevenueTrend
);

router.get(
  "/attendance-trend",
  authenticateToken,
  authorizeRoles("Admin", "Manager"),
  reportsController.getAttendanceTrend
);

router.get(
  "/preview",
  authenticateToken,
  authorizeRoles("Admin", "Manager"),
  reportsController.getReportPreview
);

router.get(
  "/export/pdf",
  authenticateToken,
  authorizeRoles("Admin", "Manager"),
  reportsController.exportPdf
);

router.get(
  "/export/excel",
  authenticateToken,
  authorizeRoles("Admin", "Manager"),
  reportsController.exportExcel
);



module.exports = router;

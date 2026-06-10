const express = require("express");
const router = express.Router();
const controller = require("./payroll.controller");

/* EXISTING ROUTES */
router.get("/summary", controller.getPayrollSummary);
router.get("/", controller.getPayrollRecords);
router.get("/:employeeId", controller.getPayrollDetails);

/* 🔴 ADD THESE TWO ROUTES */
router.post("/approve/:employeeId", controller.approvePayroll);
router.post("/pay/:employeeId", controller.markPayrollPaid);
// payroll.routes.js
router.put(
  "/deductions/:employeeId",
  controller.updatePayrollDeductions
);

router.put(
  "/status/:employeeId",
  controller.updatePayrollStatus
);



module.exports = router;

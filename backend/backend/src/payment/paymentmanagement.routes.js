const express = require("express");

const router = express.Router();

const {
  getPaymentManagement,
} = require("./paymentmanagement.controller");

router.get("/", getPaymentManagement);

module.exports = router;
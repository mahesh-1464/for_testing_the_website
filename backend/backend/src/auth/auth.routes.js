const express = require("express");
const router = express.Router();

const { forgotPassword } = require("./auth.controller");
const { resetPassword } = require("./auth.controller");

router.post("/forgot-password", forgotPassword);
router.post("/reset-password/:token", resetPassword);

module.exports = router;
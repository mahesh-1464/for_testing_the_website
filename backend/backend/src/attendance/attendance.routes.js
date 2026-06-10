const express = require("express");
const router = express.Router();
const upload = require("../middleware/upload");
const db = require("../config/db");

const {
  getAttendance,
  uploadCheckInPhoto,
  uploadCheckOutPhoto,
} = require("./attendance.controller");

router.get("/", getAttendance);

// 📸 Photo upload routes
router.post("/:id/check-in-photo", upload.single("photo"), uploadCheckInPhoto);
router.post("/:id/check-out-photo", upload.single("photo"), uploadCheckOutPhoto);
module.exports = router;

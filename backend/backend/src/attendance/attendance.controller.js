const db = require("../config/db");

const getAttendance = async (req, res) => {
  try {
    const result = await db.query(`
SELECT
  id,
  employee_id,
  name,
  role,
  colo,
  hall,
  date,
  shift_start,
  shift_end,
  clock_in,
  clock_out,
  status,
  remarks,
  gps_valid,
  gps_lat,
  gps_long,
  in_photo,
  out_photo,
  in_photo_time,
  out_photo_time
      FROM attendance
      ORDER BY date DESC
    `);

    res.status(200).json({
      success: true,
      data: result.rows,
    });
  } catch (err) {
    console.error("ATTENDANCE ERROR 👉", err.message);
    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
};
const uploadCheckInPhoto = async (req, res) => {
  try {
    const { photo, gps_lat, gps_long, gps_valid } = req.body;
    const attendanceId = req.params.id;

    await db.query(
      `
      UPDATE attendance
      SET
        in_photo = $1,
        in_photo_time = NOW(),
        clock_in = NOW(), 
        gps_lat = $2,
        gps_long = $3,
        gps_valid = $4
      WHERE id = $5
      `,
      [photo, gps_lat, gps_long, gps_valid, attendanceId]
    );

    res.status(200).json({
      success: true,
      message: "Check-in photo uploaded successfully",
    });
  } catch (err) {
    console.error("CHECK-IN PHOTO ERROR:", err.message);
    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
};

const uploadCheckOutPhoto = async (req, res) => {
  try {
    const photoPath = req.uploads ? req.uploads.path : null;
    const {  gps_lat, gps_long, gps_valid } = req.body;
    const attendanceId = req.params.id;

   await db.query(
  `
  UPDATE attendance
  SET
    in_photo = $1,
    in_photo_time = NOW(),
    clock_out = NOW(), 
    gps_lat = $2,
    gps_long = $3,
    gps_valid = $4
  WHERE id = $5
  `,
  [photoPath, gps_lat, gps_long, gps_valid, attendanceId]
);

    res.status(200).json({
      success: true,
      message: "Check-out photo uploaded successfully",
    });
  } catch (err) {
    console.error("CHECK-OUT PHOTO ERROR:", err.message);
    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
};


module.exports = {
  getAttendance,
  uploadCheckInPhoto,
  uploadCheckOutPhoto,

};

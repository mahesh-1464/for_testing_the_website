// -------------------------------------------
// ATTENDANCE MANAGEMENT – CAMERA + HOURS + OT
// -------------------------------------------

import React, { useEffect, useState, useMemo, useRef } from "react";
import axios from "axios";
import {
  Box,
  Card,
  CardContent,
  Typography,
  Grid,
  TextField,
  MenuItem,
  Chip,
  IconButton,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
} from "@mui/material";

import VisibilityIcon from "@mui/icons-material/Visibility";
import LocationOnIcon from "@mui/icons-material/LocationOn";
import HighlightOffIcon from "@mui/icons-material/HighlightOff";
import CameraAltIcon from "@mui/icons-material/CameraAlt";
import Webcam from "react-webcam";

// ----------------------
// Helper Time Functions
// ----------------------
function toMinutes(time) {
  if (!time) return 0;
  const [t, modifier] = time.split(" ");
  let [hours, minutes] = t.split(":").map(Number);

  if (modifier === "PM" && hours !== 12) hours += 12;
  if (modifier === "AM" && hours === 12) hours = 0;

  return hours * 60 + minutes;
}

function formatHHMM(mins) {
  if (!mins || mins <= 0) return "00:00";
  const h = Math.floor(mins / 60);
  const m = mins % 60;
  return `${String(h).padStart(2, "0")}:${String(m).padStart(2, "0")}`;
}

function nowTimeString() {
  const d = new Date();
  let hours = d.getHours();
  const minutes = d.getMinutes();
  const ampm = hours >= 12 ? "PM" : "AM";
  if (hours === 0) hours = 12;
  else if (hours > 12) hours -= 12;
  return `${String(hours).padStart(2, "0")}:${String(minutes).padStart(
    2,
    "0"
  )} ${ampm}`;
}
const formatTime = (time) => {
  if (!time) return null;

  let [h, m] = time.split(":");
  h = parseInt(h);

  const ampm = h >= 12 ? "PM" : "AM";
  if (h > 12) h -= 12;
  if (h === 0) h = 12;

  return `${String(h).padStart(2, "0")}:${m} ${ampm}`;
};


// const formData = new FormData();
// formData.append("photo", imageSrc); // or convert to blob if backend requires

// formData.append("gps_lat", null);
// formData.append("gps_long", null);
// formData.append("gps_valid", true);

// await axios.post(url, formData, {
//   headers: {
//     "Content-Type": "multipart/form-data",
//   },
// });

const base64ToBlob = (base64) => {
  const arr = base64.split(",");
  const mime = arr[0].match(/:(.*?);/)[1];
  const bstr = atob(arr[1]);
  let n = bstr.length;
  const u8arr = new Uint8Array(n);

  while (n--) {
    u8arr[n] = bstr.charCodeAt(n);
  }

  return new Blob([u8arr], { type: mime });
};

 


// ----------------------
// Initial Data
// ----------------------
// const initialAttendance = [
//   {
//     id: 1,
//     name: "Ravi Kumar",
//     role: "Helper",
//     colo: "COLO A",
//     hall: "Hall 1",
//     shiftStart: "09:00 AM",
//     shiftEnd: "06:00 PM",
//     clockIn: "09:05 AM",
//     clockOut: "06:02 PM",
//     gpsValid: true,
//     status: "Present",
//     date: "2025-12-05",
//     remarks: "Slightly late due to traffic",
//     gpsLocation: { lat: 17.4123, long: 78.4512 },
//     inPhoto: null,
//     outPhoto: null,
//     inPhotoTime: null,
//     outPhotoTime: null,
//   },
//   {
//     id: 2,
//     name: "Anita Sharma",
//     role: "Supervisor",
//     colo: "COLO B",
//     hall: "Hall 3",
//     shiftStart: "09:00 AM",
//     shiftEnd: "06:00 PM",
//     clockIn: null,
//     clockOut: null,
//     gpsValid: false,
//     status: "Absent",
//     date: "2025-12-05",
//     remarks: "No update received",
//     gpsLocation: null,
//     inPhoto: null,
//     outPhoto: null,
//     inPhotoTime: null,
//     outPhotoTime: null,
//   },
//   {
//     id: 3,
//     name: "Manoj Singh",
//     role: "Helper",
//     colo: "COLO A",
//     hall: "Hall 2",
//     shiftStart: "09:00 AM",
//     shiftEnd: "06:00 PM",
//     clockIn: "09:25 AM",
//     clockOut: "05:40 PM",
//     gpsValid: true,
//     status: "Late",
//     date: "2025-12-05",
//     remarks: "Late arrival",
//     gpsLocation: { lat: 17.404, long: 78.478 },
//     inPhoto: null,
//     outPhoto: null,
//     inPhotoTime: null,
//     outPhotoTime: null,
//   },
// ];

const roles = ["Helper", "Supervisor", "Site Manager", "Site Engineer"];
const colos = ["COLO A", "COLO B", "COLO C"];
const statuses = ["Present", "Absent", "Late", "Early Exit"];

export default function AttendanceManagement() {
  const [attendance, setAttendance] = useState([]);

  const [imageSrc, setImageSrc] = useState(null); 
const [url, setUrl] = useState("");
const [dateFilter, setDateFilter] = useState(
  new Date().toISOString().slice(0, 10)
);
  const [roleFilter, setRoleFilter] = useState("All");
  const [coloFilter, setColoFilter] = useState("All");
  const [statusFilter, setStatusFilter] = useState("All");

  const [viewOpen, setViewOpen] = useState(false);
  const [cameraOpen, setCameraOpen] = useState(false);


  const [selectedRecord, setSelectedRecord] = useState(null);
  const [captureType, setCaptureType] = useState("IN"); // "IN" | "OUT"

  const [selectedMonth, setSelectedMonth] = useState(new Date());
const [selectedDay, setSelectedDay] = useState(null);
  const webcamRef = useRef(null);

  const daysInMonth = new Date(
  selectedMonth.getFullYear(),
  selectedMonth.getMonth() + 1,
  0
).getDate();

const weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
const firstDayIndex = new Date(
  selectedMonth.getFullYear(),
  selectedMonth.getMonth(),
  1
).getDay();

// ✅ FIRST: day map
const getDayStatusMap = useMemo(() => {
  const map = {};

  attendance.forEach((rec) => {
    if (!rec.date) return;

    const d = new Date(rec.date);

    if (
      d.getMonth() !== selectedMonth.getMonth() ||
      d.getFullYear() !== selectedMonth.getFullYear()
    ) return;

    const day = d.getDate();

    if (!map[day]) map[day] = rec.status;
    else {
      if (rec.status === "Absent") map[day] = "Absent";
      else if (rec.status === "Late" && map[day] !== "Absent")
        map[day] = "Late";
      else if (
        rec.status === "Present" &&
        map[day] !== "Absent" &&
        map[day] !== "Late"
      )
        map[day] = "Present";
    }
  });

  return map;
}, [attendance, selectedMonth]);



const stats = useMemo(() => {
  let present = 0,
    absent = 0,
    late = 0;

  attendance.forEach((rec) => {
    const d = new Date(rec.date);

    if (
      d.getMonth() === selectedMonth.getMonth() &&
      d.getFullYear() === selectedMonth.getFullYear()
    ) {
      if (rec.status === "Present") present++;
      if (rec.status === "Absent") absent++;
      if (rec.status === "Late") late++;
    }
  });

  return {
    workingDays: present + absent + late,
    present,
    absent,
    late,
  };
}, [attendance, selectedMonth]);

// -------------------------
  // CALCULATE Total Hours + OT (with -2hr lunch)
  // -------------------------
  function calculateHours(rec) {
    if (!rec.clockIn || !rec.clockOut) {
      return { totalHHMM: "00:00", otHHMM: "00:00" };
    }

    const ci = toMinutes(rec.clockIn);
    const co = toMinutes(rec.clockOut);
    const shiftEnd = toMinutes(rec.shiftEnd);

    let total = co - ci;

    // Always deduct lunch: 12:30–2:30 (2 hours = 120 minutes)
    total -= 120;
    if (total < 0) total = 0;

    const ot = co > shiftEnd ? co - shiftEnd : 0;

    return {
      totalHHMM: formatHHMM(total),
      otHHMM: formatHHMM(ot),
    };
  }
const holidays = [
  "2026-01-01", // New Year
  "2026-01-14", // Sankranti
  "2026-08-15", // Independence Day
];
const isHoliday = (day) => {
  const d = new Date(
    selectedMonth.getFullYear(),
    selectedMonth.getMonth(),
    day
  )
    .toISOString()
    .slice(0, 10);

  return holidays.includes(d);
};

  // -------------------------
  // FILTER + ENRICH DATA
  // -------------------------
const filteredData = useMemo(() => {
  return attendance
    .map((rec) => ({
      ...rec,
      ...calculateHours(rec),
    }))
    .filter((a) => {
      const d = new Date(a.date);

      const matchMonth =
        d.getMonth() === selectedMonth.getMonth() &&
        d.getFullYear() === selectedMonth.getFullYear();

      const matchDay =
        selectedDay === null || d.getDate() === selectedDay;

      const matchRole = roleFilter === "All" || a.role === roleFilter;
      const matchColo = coloFilter === "All" || a.colo === coloFilter;
      const matchStatus =
        statusFilter === "All" || a.status === statusFilter;

      return matchMonth && matchDay && matchRole && matchColo && matchStatus;
    });
}, [attendance, selectedMonth, selectedDay, roleFilter, coloFilter, statusFilter]);

  // -------------------------
  // CAMERA HANDLERS
  // -------------------------
  const openCamera = (record, type) => {
    setSelectedRecord(record);
    setCaptureType(type); // "IN" or "OUT"
    setCameraOpen(true);
  };



const handlePrevMonth = () => {
  setSelectedMonth((prev) => {
    const d = new Date(prev);
    d.setMonth(d.getMonth() - 1);
    return d;
  });
};

const handleNextMonth = () => {
  setSelectedMonth((prev) => {
    const d = new Date(prev);
    d.setMonth(d.getMonth() + 1);
    return d;
  });
};

const capturePhoto = async () => {
  const imageSrc = webcamRef.current?.getScreenshot();
  if (!imageSrc || !selectedRecord) return;

  const timeStr = nowTimeString();

  // ✅ 1. Update UI immediately
  const updated = attendance.map((item) => {
    if (item.id === selectedRecord.id) {
      if (captureType === "IN") {
        return {
          ...item,
          inPhoto: imageSrc,
          inPhotoTime: timeStr,
          outPhotoTime: null,
          clockIn: timeStr,
        };
      } else {
        return {
          ...item,
          outPhoto: imageSrc,
          outPhotoTime: timeStr,
          clockOut: timeStr,
        };
      }
    }
    return item;
  });

  setAttendance(updated);

  // also update selected record
  setSelectedRecord((prev) =>
    prev
      ? captureType === "IN"
        ? { ...prev, inPhoto: imageSrc, inPhotoTime: timeStr }
        : { ...prev, outPhoto: imageSrc, outPhotoTime: timeStr }
      : prev
  );

  setCameraOpen(false);

// ✅ 2. Send to backend (async)
try {
  const url =
    captureType === "IN"
      ? `${window.API_BASE}/api/attendance/${selectedRecord.id}/check-in-photo`
      : `${window.API_BASE}/api/attendance/${selectedRecord.id}/check-out-photo`;

  const blob = base64ToBlob(imageSrc);

  const formData = new FormData();
  formData.append("photo", blob, "attendance.jpg");
  formData.append("gps_lat", null);
  formData.append("gps_long", null);
  formData.append("gps_valid", true);

  const res = await axios.post(url, formData, {
    headers: { "Content-Type": "multipart/form-data" },
  });

  console.log("Upload success:", res.data);

  fetchAttendance();
} catch (err) {
  console.error("Upload error:", err.response?.data || err.message);
}
};


const today = new Date();

const isToday = (day) => {
  return (
    day === today.getDate() &&
    selectedMonth.getMonth() === today.getMonth() &&
    selectedMonth.getFullYear() === today.getFullYear()
  );
};

  // -------------------------
  // VIEW HANDLER
  // -------------------------
  const openView = (rec) => {
    setSelectedRecord(rec);
    setViewOpen(true);
  };

const fetchAttendance = async () => {
  try {
    const res = await axios.get(window.API_BASE + "/api/attendance");

    console.log("API FULL:", res.data.data);

    // ✅ FIX HERE
    const rawData = res.data.data;

const formatBackendTime = (time) => {
  if (!time) return null;

  let [h, m] = time.split(":");
  h = parseInt(h);

  const ampm = h >= 12 ? "PM" : "AM";
  if (h > 12) h -= 12;
  if (h === 0) h = 12;

  return `${String(h).padStart(2, "0")}:${m} ${ampm}`;
};




const formatted = rawData.map((item) => ({
  id: item.id,
  name: item.name,
  role: item.role,
  colo: item.colo,
  hall: item.hall,

  shiftStart: formatTime(item.shift_start),
  shiftEnd: formatTime(item.shift_end),
  clockIn: formatTime(item.clock_in),
  clockOut: formatTime(item.clock_out),

  status: item.status,
  date: new Date(item.date).toISOString().slice(0, 10),
  remarks: item.remarks,

  gpsValid: item.gps_valid === true,
  gpsLocation: {
    lat: item.gps_lat,
    long: item.gps_long,
  },

  inPhoto: item.in_photo,
  outPhoto: item.out_photo,
inPhotoTime: formatBackendTime(item.in_photo_time),
outPhotoTime: formatBackendTime(item.out_photo_time),
}));
    setAttendance(formatted);
  } catch (err) {
    console.error(err);
  }
};



  useEffect(() => {
  fetchAttendance();
}, []);

  return (
    <Box sx={{ background: "#e6f0ff", minHeight: "100vh", p: 3 }}>
      <Box
        sx={{
          maxWidth: "1200px",
          margin: "0 auto",
          padding: "30px",
          background: "white",
          borderRadius: "20px",
          boxShadow: "0 4px 20px rgba(0,0,0,0.05)",
        }}
      >
        <Typography variant="h4" sx={{ fontWeight: 700, mb: 3 }}>
          Attendance Management
        </Typography>

        {/* FILTERS */}
        <Grid container spacing={2} sx={{ mb: 3 }}>
          <Grid item xs={12} md={3}>
            <TextField
              fullWidth
              type="date"
              label="Date"
              InputLabelProps={{ shrink: true }}
              value={dateFilter}
              onChange={(e) => setDateFilter(e.target.value)}
            />
          </Grid>

          <Grid item xs={12} md={3}>
            <TextField
              select
              fullWidth
              label="Role"
              value={roleFilter}
              onChange={(e) => setRoleFilter(e.target.value)}
            >
              <MenuItem value="All">All</MenuItem>
              {roles.map((r) => (
                <MenuItem key={r} value={r}>
                  {r}
                </MenuItem>
              ))}
            </TextField>
          </Grid>

          <Grid item xs={12} md={3}>
            <TextField
              select
              fullWidth
              label="COLO"
              value={coloFilter}
              onChange={(e) => setColoFilter(e.target.value)}
            >
              <MenuItem value="All">All</MenuItem>
              {colos.map((c) => (
                <MenuItem key={c} value={c}>
                  {c}
                </MenuItem>
              ))}
            </TextField>
          </Grid>


<Grid container spacing={2} sx={{ mb: 3 }}>
  <Grid item xs={3}>
    <Card><CardContent>Working Days: {stats.workingDays}</CardContent></Card>
  </Grid>
  <Grid item xs={3}>
    <Card><CardContent>Present: {stats.present}</CardContent></Card>
  </Grid>
  <Grid item xs={3}>
    <Card><CardContent>Absent: {stats.absent}</CardContent></Card>
  </Grid>
  <Grid item xs={3}>
    <Card><CardContent>Late: {stats.late}</CardContent></Card>
  </Grid>
</Grid>

          <Grid item xs={12} md={3}>
            <TextField
              select
              fullWidth
              label="Status"
              value={statusFilter}
              onChange={(e) => setStatusFilter(e.target.value)}
            >
              <MenuItem value="All">All</MenuItem>
              {statuses.map((s) => (
                <MenuItem key={s} value={s}>
                  {s}
                </MenuItem>
              ))}
            </TextField>
          </Grid>
        </Grid>
<Card sx={{ mb: 3 }}>
  <CardContent>

    {/* HEADER */}
    <Box sx={{ display: "flex", justifyContent: "space-between", mb: 2 }}>
      <Button onClick={handlePrevMonth}>◀</Button>

      <Typography fontWeight={600}>
        {selectedMonth.toLocaleString("default", {
          month: "long",
          year: "numeric",
        })}
      </Typography>

      <Button onClick={handleNextMonth}>▶</Button>
    </Box>

    {/* ✅ WEEK DAYS HEADER */}
    <Box
      sx={{
        display: "grid",
        gridTemplateColumns: "repeat(7, 1fr)",
        mb: 1,
        textAlign: "center",
        fontWeight: 600,
      }}
    >
      {weekDays.map((day) => (
        <Box key={day}>{day}</Box>
      ))}
    </Box>

    {/* ✅ CALENDAR GRID */}
    <Box
      sx={{
        display: "grid",
        gridTemplateColumns: "repeat(7, 1fr)",
        gap: 1,
      }}
    >
      {/* EMPTY BOXES (before 1st day) */}
      {[...Array(firstDayIndex)].map((_, i) => (
        <Box key={`empty-${i}`} />
      ))}

      {/* DAYS */}
      {[...Array(daysInMonth)].map((_, i) => {
        const day = i + 1;

        const holidayCheck = isHoliday(day);
        const todayCheck = isToday(day);
        const status = getDayStatusMap[day];

    let bg = "#e0e0e0";

if (holidayCheck) bg = "#3f51b5"; // 🔵 holiday first
else if (status === "Present") bg = "#4caf50";
else if (status === "Absent") bg = "#f44336";
else if (status === "Late") bg = "#ff9800";

        const isSelected = selectedDay === day;
       

        return (
          <Box
            key={day}
            onClick={() =>
              setSelectedDay((prev) => (prev === day ? null : day))
            }
sx={{
  height: 45,
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  borderRadius: 2,
  cursor: "pointer",
  backgroundColor: bg,
  color: "#fff",
  fontWeight: 600,

  // ✅ Selected day
  border: isSelected ? "3px solid #1976d2" : "none",

  // ✅ TODAY highlight (strong visual)
  boxShadow: todayCheck ? "0 0 0 3px #000 inset" : "none",
}}
          >
           <Box sx={{ textAlign: "center" }}>
        <div>{day}</div>

        {/* optional holiday icon */}
        {holidayCheck && (
          <Typography sx={{ fontSize: 10 }}>🎉</Typography>
        )}
      </Box>
    </Box>
  );
})}
    </Box>

    {/* LEGEND */}
    <Box sx={{ mt: 2, display: "flex", gap: 2, flexWrap: "wrap" }}>
      <Chip label="Present" sx={{ background: "#4caf50", color: "#fff" }} />
      <Chip label="Late" sx={{ background: "#ff9800", color: "#fff" }} />
      <Chip label="Absent" sx={{ background: "#f44336", color: "#fff" }} />
      <Chip label="No Data" sx={{ background: "#e0e0e0" }} />
    </Box>

  </CardContent>
</Card>

        {/* TABLE */}
        <Card>
          <CardContent>
            <Box
              component="table"
              sx={{ width: "100%", borderCollapse: "collapse" }}
            >
              <Box component="thead" sx={{ bgcolor: "#f0f3fa" }}>
                <Box component="tr">
                  {[
                    "Name",
                    "Role",
                    "Location",
                    "Shift",
                    "Clock-in",
                    "Clock-out",
                    "GPS",
                    "Status",
                    "Total Hrs",
                    "OT",
                    "IN Pic",
                    "OUT Pic",
                    "View",
                  ].map((h) => (
                    <Box
                      component="th"
                      key={h}
                      sx={{ p: 1.5, fontWeight: 600 }}
                    >
                      {h}
                    </Box>
                  ))}
                </Box>
              </Box>

              <Box component="tbody">
                {filteredData.map((a) => (
                  <Box
                    component="tr"
                    key={a.id}
                    sx={{ borderBottom: "1px solid #eee" }}
                  >
                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.name}
                    </Box>
                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.role}
                    </Box>
                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.colo} / {a.hall}
                    </Box>
                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.shiftStart} - {a.shiftEnd}
                    </Box>
                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.clockIn || "-"}
                    </Box>
                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.clockOut || "-"}
                    </Box>

                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.gpsValid ? (
                        <Chip
                          label="Valid"
                          icon={<LocationOnIcon />}
                          color="success"
                          size="small"
                        />
                      ) : (
                        <Chip
                          label="Invalid"
                          icon={<HighlightOffIcon />}
                          color="error"
                          size="small"
                        />
                      )}
                    </Box>

                    <Box component="td" sx={{ p: 1.5 }}>
                      <Chip
                        label={a.status}
                        color={
                          a.status === "Present"
                            ? "success"
                            : a.status === "Absent"
                            ? "error"
                            : a.status === "Late"
                            ? "warning"
                            : "default"
                        }
                        size="small"
                      />
                    </Box>

                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.totalHHMM}
                    </Box>

                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.otHHMM}
                    </Box>

                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.inPhoto ? (
                        <Chip label="Yes" color="success" size="small" />
                      ) : (
                        <Button
                          size="small"
                          variant="outlined"
                          startIcon={<CameraAltIcon />}
                          onClick={() => openCamera(a, "IN")}
                        >
                          Capture
                        </Button>
                      )}
                    </Box>

                    <Box component="td" sx={{ p: 1.5 }}>
                      {a.outPhoto ? (
                        <Chip label="Yes" color="success" size="small" />
                      ) : (
                        <Button
                          size="small"
                          variant="outlined"
                          startIcon={<CameraAltIcon />}
                          onClick={() => openCamera(a, "OUT")}
                        >
                          Capture
                        </Button>
                      )}
                    </Box>

                    <Box component="td" sx={{ p: 1.5 }}>
                      <IconButton onClick={() => openView(a)}>
                        <VisibilityIcon />
                      </IconButton>
                    </Box>
                  </Box>
                ))}
              </Box>
            </Box>
          </CardContent>
        </Card>
      </Box>

      {/* CAMERA POPUP */}
      <Dialog
        open={cameraOpen}
        onClose={() => setCameraOpen(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>Capture {captureType} Photo</DialogTitle>
        <DialogContent dividers>
          <Webcam
            audio={false}
            ref={webcamRef}
            screenshotFormat="image/jpeg"
            style={{ width: "100%", borderRadius: 10 }}
            videoConstraints={{ facingMode: "environment" }}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setCameraOpen(false)}>Cancel</Button>
          <Button variant="contained" onClick={capturePhoto}>
            Capture
          </Button>
        </DialogActions>
      </Dialog>

      {/* VIEW DETAILS */}
      <Dialog
        open={viewOpen}
        onClose={() => setViewOpen(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>Attendance Details</DialogTitle>
        <DialogContent dividers>
          {selectedRecord && (
            <>
              <Typography>
                <b>Name:</b> {selectedRecord.name}
              </Typography>
              <Typography>
                <b>Role:</b> {selectedRecord.role}
              </Typography>
              <Typography>
                <b>Location:</b> {selectedRecord.colo} /{" "}
                {selectedRecord.hall}
              </Typography>
              <Typography>
                <b>Date:</b> {selectedRecord.date}
              </Typography>
              <Typography>
                <b>Shift:</b> {selectedRecord.shiftStart} -{" "}
                {selectedRecord.shiftEnd}
              </Typography>
              <Typography>
                <b>Clock-in:</b>{" "}
                {selectedRecord.clockIn || "Not Recorded"}
              </Typography>
              <Typography>
                <b>Clock-out:</b>{" "}
                {selectedRecord.clockOut || "Not Recorded"}
              </Typography>
              <Typography>
                <b>Total Hours:</b> {selectedRecord.totalHHMM}
              </Typography>
              <Typography>
                <b>Overtime:</b> {selectedRecord.otHHMM}
              </Typography>
              <Typography>
                <b>Status:</b> {selectedRecord.status}
              </Typography>
              <Typography>
                <b>Remarks:</b> {selectedRecord.remarks || "None"}
              </Typography>

              {/* IN Photo */}
              <Box sx={{ mt: 3 }}>
                <Typography sx={{ fontWeight: 600 }}>IN Photo</Typography>
                {selectedRecord.inPhoto ? (
                  <>
                    <Typography sx={{ fontSize: 12, mb: 1 }}>
                      Captured At: {selectedRecord.inPhotoTime || "-"}
                    </Typography>
                    <Box
                      component="img"
src={
  selectedRecord.inPhoto?.startsWith("data:")
    ? selectedRecord.inPhoto
    : `${window.API_BASE}/${selectedRecord.inPhoto}`
}                      alt="IN"
                      sx={{
                        width: "100%",
                        maxHeight: 220,
                        objectFit: "cover",
                        borderRadius: 2,
                        border: "1px solid #e0e0e0",
                      }}
                    />
                  </>
                ) : (
                  <Typography>No IN photo captured.</Typography>
                )}
              </Box>

              {/* OUT Photo */}
              <Box sx={{ mt: 3 }}>
                <Typography sx={{ fontWeight: 600 }}>OUT Photo</Typography>
                {selectedRecord.outPhoto ? (
                  <>
                    <Typography sx={{ fontSize: 12, mb: 1 }}>
                      Captured At: {selectedRecord.outPhotoTime || "-"}
                    </Typography>
                    <Box
                      component="img"
src={
  selectedRecord.outPhoto?.startsWith("data:")
    ? selectedRecord.outPhoto
    : `${window.API_BASE}/${selectedRecord.outPhoto}`
}
                      alt="OUT"
                      sx={{
                        width: "100%",
                        maxHeight: 220,
                        objectFit: "cover",
                        borderRadius: 2,
                        border: "1px solid #e0e0e0",
                      }}
                    />
                  </>
                ) : (
                  <Typography>No OUT photo captured.</Typography>
                )}
              </Box>

              {/* GPS INFO */}
              <Box sx={{ mt: 3 }}>
                <Typography sx={{ fontWeight: 600 }}>
                  GPS Location
                </Typography>
                {selectedRecord.gpsLocation ? (
                  <>
                    <Typography>
                      Latitude: {selectedRecord.gpsLocation.lat}
                    </Typography>
                    <Typography>
                      Longitude: {selectedRecord.gpsLocation.long}
                    </Typography>
                  </>
                ) : (
                  <Typography>No GPS Data</Typography>
                )}
              </Box>
            </>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setViewOpen(false)}>Close</Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

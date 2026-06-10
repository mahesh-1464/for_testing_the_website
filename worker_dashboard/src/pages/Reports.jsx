import React, { useEffect, useState} from "react";
import {
  Box,
  Card,
  CardContent,
  Typography,
  Grid,
  Chip,
 
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
} from "@mui/material";

import AssignmentTurnedInIcon from "@mui/icons-material/AssignmentTurnedIn";
import AccessTimeIcon from "@mui/icons-material/AccessTime";
import CheckCircleIcon from "@mui/icons-material/CheckCircle";

import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  Tooltip,
  ResponsiveContainer,
} from "recharts";

/* ---------------- WORKER CONTEXT ---------------- */
// const worker = {
//   name: "Ravi Kumar",
//   role: "Helper",
//   colo: "COLO A",
// };

// /* ---------------- PERSONAL DATA ---------------- */
// const taskTrend = [
//   { day: "Mon", completed: 5 },
//   { day: "Tue", completed: 6 },
//   { day: "Wed", completed: 4 },
//   { day: "Thu", completed: 7 },
//   { day: "Fri", completed: 6 },
// ];

// const attendanceSummary = [
//   { id: "A-01", date: "2025-12-02", status: "Present", hours: "08:45" },
//   { id: "A-02", date: "2025-12-03", status: "Late", hours: "07:50" },
//   { id: "A-03", date: "2025-12-04", status: "Present", hours: "08:20" },
// ];

/* ================= COMPONENT ================= */
export default function WorkerReports() {

  const [worker, setWorker] = useState(null);
  const [summary, setSummary] = useState({});
  const [taskTrend, setTaskTrend] = useState([]);
  const [attendanceSummary, setAttendanceSummary] = useState([]);

  const token = localStorage.getItem("token");

  console.log("TOKEN:", token);
const handleReportData = (data) => {

  console.log("API RESPONSE:", data);

  setSummary(data.summary || {});

  setWorker(data.worker || {
    name: "Worker",
    role: "worker",
    colo: "COLO"
  });

  setTaskTrend(data.trend || []);

  setAttendanceSummary(data.attendance || []);
};
  useEffect(() => {
    fetch(window.API_BASE + "/api/reports/worker-summary", {
      headers: {
        Authorization: `Bearer ${token}`,
        
      },
    })
    
      .then(async (res) => {

  console.log("STATUS:", res.status);

  const data = await res.json();

  console.log("API DATA:", data);

  return data;
})
.then((data) => {
  console.log("FULL API DATA:", data);
  console.log("SUMMARY:", data.summary);
  console.log("TREND:", data.trend);
  console.log("ATTENDANCE:", data.attendance);

  handleReportData({

  summary: {
    tasksCompleted: 12,
    avgHours: "08:30",
    attendanceRate: 95,
  },

  trend: [
    { day: "Mon", completed: 4 },
    { day: "Tue", completed: 6 },
    { day: "Wed", completed: 5 },
  ],

  attendance: [
    {
      date: "2026-05-20",
      status: "Present",
      working_hours: "08:30",
    },

    {
      date: "2026-05-21",
      status: "Late",
      working_hours: "07:45",
    },
  ],

  worker: {
    name: "Demo Worker",
    role: "worker",
    colo: "COLO A",
  },
});
})
      .catch(err => console.error(err));
  }, [token]);

useEffect(() => {
fetch(window.API_BASE + "/api/auth/me", {    headers: {
      Authorization: `Bearer ${token}`,
    },
  })
    .then(res => res.json())
    .then(data => setWorker(data));
}, []);



  return (
    <Box
      sx={{
        minHeight: "100vh",
        background: "#f5f7fb",
        p: { xs: 3, md: 5 },
      }}
    >
      {/* ================= HEADER ================= */}
      <Box sx={{ mb: 4 }}>
        <Typography variant="h4" fontWeight={700}>
          My Reports
        </Typography>
       <Typography color="text.secondary">
{worker?.name || "Worker"} • {worker?.role || "worker"} • {worker?.colo || "COLO"}
</Typography>
      </Box>

      {/* ================= KPI CARDS ================= */}
      <Grid container spacing={3} sx={{ mb: 4 }}>
        <Grid item xs={12} sm={4}>
          <Card>
            <CardContent>
              <AssignmentTurnedInIcon color="primary" />
              <Typography color="text.secondary">
                Tasks Completed
              </Typography>
              <Typography variant="h4" fontWeight={700}>
  {summary?.tasksCompleted || 0}
</Typography>
            </CardContent>
          </Card>
        </Grid>

        <Grid item xs={12} sm={4}>
          <Card>
            <CardContent>
              <AccessTimeIcon color="warning" />
              <Typography color="text.secondary">
                Avg Working Hours
              </Typography>
              <Typography variant="h4" fontWeight={700}>
                {summary?.avgHours || "00:00"}
              </Typography>
            </CardContent>
          </Card>
        </Grid>

        <Grid item xs={12} sm={4}>
          <Card>
            <CardContent>
              <CheckCircleIcon color="success" />
              <Typography color="text.secondary">
                Attendance %
              </Typography>
              <Typography variant="h4" fontWeight={700}>
                {summary?.attendanceRate || 0}%
              </Typography>
            </CardContent>
          </Card>
        </Grid>
      </Grid>

      {/* ================= TASK TREND ================= */}
      <Card sx={{ mb: 4 }}>
        <CardContent>
          <Typography variant="h6" fontWeight={700} mb={2}>
            My Task Completion Trend
          </Typography>

          <ResponsiveContainer width="100%" height={250}>
            <LineChart data={taskTrend}>
              <XAxis dataKey="day" />
              <YAxis />
              <Tooltip />
              <Line
                dataKey="completed"
                stroke="#1976d2"
                strokeWidth={3}
              />
            </LineChart>
          </ResponsiveContainer>
        </CardContent>
      </Card>

      {/* ================= ATTENDANCE TABLE ================= */}
      <Card>
        <CardContent>
          <Box
            sx={{
              display: "flex",
              justifyContent: "space-between",
              mb: 2,
            }}
          >
            <Typography variant="h6" fontWeight={700}>
              My Attendance Summary
            </Typography>
            <Chip label="Read Only" color="info" />
          </Box>

          <Table size="small">
            <TableHead>
              <TableRow>
                <TableCell>Date</TableCell>
                <TableCell>Status</TableCell>
                <TableCell>Working Hours</TableCell>
              </TableRow>
            </TableHead>

<TableBody>
{attendanceSummary?.length === 0 ? (

  <TableRow>
    <TableCell colSpan={3} align="center">
      No attendance data
    </TableCell>
  </TableRow>
  

) : (

  attendanceSummary.map((row) => (
    <TableRow key={row.date}>
      <TableCell>{row.date}</TableCell>

      <TableCell>
        <Chip
          size="small"
          label={row.status}
          color={
            row.status === "Present"
              ? "success"
              : row.status === "Late"
              ? "warning"
              : "default"
          }
        />
      </TableCell>

      <TableCell>{row.working_hours}</TableCell>
    </TableRow>
  ))

)}

</TableBody>
          </Table>
        </CardContent>
      </Card>
    </Box>
  );
}

import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

import {
  Box,
  Typography,
  Grid,
  Card,
  CardContent,
  Chip,
  Button,
  Divider,
  TextField,
} from "@mui/material";



/* ---------------- ATTENDANCE DATA ---------------- */

// const attendanceHistory = [
//   {
//     date: "2025-01-18",
//     checkIn: "09:02 AM",
//     checkOut: "06:01 PM",
//     status: "Present",
//     location: "COLO A",
//   },
//   {
//     date: "2025-01-19",
//     checkIn: "09:10 AM",
//     checkOut: "06:05 PM",
//     status: "Present",
//     location: "COLO A",
//   },
//   {
//     date: "2025-01-20",
//     checkIn: "--",
//     checkOut: "--",
//     status: "Absent",
//     location: "-",
//   },
// ];





// /* ---------------- TASK DATA ---------------- */

// const initialTasks = [
//   {
//     id: 1,
//     title: "Site Inspection",
//     location: "COLO A",
//     scheduledTime: "10:00 AM",
//     status: "Pending",
//   },
//   {
//     id: 2,
//     title: "Equipment Check",
//     location: "COLO A",
//     scheduledTime: "02:00 PM",
//     status: "Pending",
//   },
// ];

// /* ---------------- INVENTORY DATA ---------------- */

// const initialInventory = [
//   {
//     id: 1,
//     item: "Safety Helmet",
//     quantity: 2,
//     unit: "Nos",
//   },
//   {
//     id: 2,
//     item: "Inspection Tool Kit",
//     quantity: 1,
//     unit: "Set",
//   },
// ];

// /* ---------------- TABLE STYLES ---------------- */

// const thStyle = {
//   textAlign: "left",
//   padding: "10px",
//   borderBottom: "1px solid #ddd",
// };

// const tdStyle = {
//   padding: "10px",
//   borderBottom: "1px solid #eee",
// };


/* ---------------- TABLE STYLES ---------------- */

const thStyle = {
  textAlign: "left",
  padding: "10px",
  borderBottom: "1px solid #ddd",
};

const tdStyle = {
  padding: "10px",
  borderBottom: "1px solid #eee",
};

/* ---------------- COMPONENT ---------------- */

export default function WorkerDashboard() {


  const navigate = useNavigate();

const goToAttendance = () => {
  navigate("/worker/attendance");
};
  /* -------- STATE -------- */
  const [tasks, setTasks] = useState([]);
  const [inventory, setInventory] = useState([]);
  const [inventoryHistory, setInventoryHistory] = useState([]);

  const [attendanceHistory, setAttendanceHistory] = useState([]);

    /* -------- ATTENDANCE CALC -------- */
  const totalDays = attendanceHistory.length;
  const presentDays = attendanceHistory.filter(
    (a) => a.status === "Present"
  ).length;

  const attendancePercent =
    totalDays > 0
      ? Math.round((presentDays / totalDays) * 100)
      : 0;

  /* -------- TASK CALC -------- */
  const totalTasks = tasks.length;
  const completedTasks = tasks.filter(
    (t) => t.status === "Completed"
  ).length;

  const pendingTasks = totalTasks - completedTasks;

  const completionPercent =
    totalTasks > 0
      ? Math.round((completedTasks / totalTasks) * 100)
      : 0;

  /* -------- TASK ACTIONS -------- */
const startTask = async (id) => {
  try {
    await axios.put(
      `http://localhost:8000/api/tasks/${id}`,
      {
        status: "In Progress",
      }
    );

    alert("Inventory consumed successfully");
    fetchDashboardData();
  } catch (error) {
    console.log(error);
  }
};

const completeTask = async (id) => {
  try {
    await axios.put(
      `http://localhost:8000/api/tasks/${id}`,
      {
        status: "Completed",
      }
    );

    fetchDashboardData();
  } catch (error) {
    console.log(error);
  }
};

  /* -------- INVENTORY ACTION -------- */
const consumeItem = async (item, qty) => {

  console.log("ITEM:", item);
  console.log("QTY:", qty);

  try {

    const response = await axios.post(
      "http://localhost:8000/api/inventory/consume",
      {
        inventoryId: item.id,
        quantity: qty,
      }
    );

    console.log("RESPONSE:", response.data);

    console.log("ITEM:", item);
    alert("Inventory consumed successfully");

    fetchDashboardData();

  } catch (error) {

    console.log("ERROR:", error);

console.log(error.response?.data);
console.log(error);

alert(
  error.response?.data?.message ||
  "Consume failed"
);
  }
};


useEffect(() => {
  fetchDashboardData();
}, []);

useEffect(() => {

  const employeeId = localStorage.getItem("employee_id");

  const watchId = navigator.geolocation.watchPosition(

    async (position) => {

      const lat = position.coords.latitude;
      const lng = position.coords.longitude;

      try {

        await fetch(
          "http://localhost:8000/api/location/worker/update",
          {
            method: "POST",

            headers: {
              "Content-Type": "application/json",
            },

            body: JSON.stringify({
              workerId: employeeId,
              latitude: lat,
              longitude: lng,
            }),
          }
        );

        console.log("Location Updated");

      } catch (err) {

        console.error("Location Error:", err);

      }
    },

    (err) => {
      console.error(err);
    },

    {
      enableHighAccuracy: true,
      maximumAge: 0,
      timeout: 5000,
    }

  );

  return () => {
    navigator.geolocation.clearWatch(watchId);
  };

}, []);

const fetchDashboardData = async () => {
  try {
    const token = localStorage.getItem("token");

    const config = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    };

    // Attendance
    const attendanceRes = await axios.get(
      "http://localhost:8000/api/attendance",
      config
    );

    // Tasks
    const tasksRes = await axios.get(
      "http://localhost:8000/api/tasks",
      config
    );

    // Inventory
    const inventoryRes = await axios.get(
      "http://localhost:8000/api/inventory",
      config
    );

    //Inventory History
const historyRes = await axios.get(
  "http://localhost:8000/api/inventory/history"
);

setAttendanceHistory(attendanceRes.data.data || []);
setTasks(tasksRes.data.data || []);
setInventory(inventoryRes.data.data || []);
setInventoryHistory(historyRes.data.data || []);

  } catch (error) {
    console.log("Dashboard fetch error:", error);
  }
};



  return (
<Box
  p={3}
  sx={{
    background: "#f5f7fa",
    minHeight: "100vh",
    mt: 8,
  }}
>
        <Typography variant="h5" fontWeight={600} mb={3}>
        Worker Dashboard
      </Typography>

      {/* ================= ATTENDANCE SUMMARY ================= */}
<Grid container spacing={2} mb={6}>
  <Grid item xs={12} md={4}>
    <Card
      sx={{
        cursor: "pointer",
        "&:hover": { boxShadow: 6 },
      }}
      onClick={goToAttendance}
    >
      <CardContent>
        <Typography variant="subtitle2">Total Days</Typography>
        <Typography variant="h4">{totalDays}</Typography>
        <Typography variant="body2" color="text.secondary">
          Click to view attendance
        </Typography>
      </CardContent>
    </Card>
  </Grid>

  <Grid item xs={12} md={4}>
    <Card
      sx={{
        cursor: "pointer",
        "&:hover": { boxShadow: 6 },
      }}
      onClick={goToAttendance}
    >
      <CardContent>
        <Typography variant="subtitle2">Present Days</Typography>
        <Typography variant="h4">{presentDays}</Typography>
        <Typography variant="body2" color="text.secondary">
          Click to view attendance
        </Typography>
      </CardContent>
    </Card>
  </Grid>

  <Grid item xs={12} md={4}>
    <Card
      sx={{
        cursor: "pointer",
        "&:hover": { boxShadow: 6 },
      }}
      onClick={goToAttendance}
    >
      <CardContent>
        <Typography variant="subtitle2">Attendance %</Typography>
        <Typography
          variant="h4"
          color={attendancePercent >= 75 ? "green" : "red"}
        >
          {attendancePercent}%
        </Typography>
        <Typography variant="body2" color="text.secondary">
          Click to view attendance
        </Typography>
      </CardContent>
    </Card>
  </Grid>
</Grid>

      {/* ================= TASK COMPLETION REPORT ================= */}
      <Typography variant="h6" mb={2}>
        Task Completion Report
      </Typography>

      <Grid container spacing={2} mb={4}>
        <Grid item xs={12} md={3}>
          <Card>
            <CardContent>
              <Typography>Total Tasks</Typography>
              <Typography variant="h5">{totalTasks}</Typography>
            </CardContent>
          </Card>
        </Grid>
        <Grid item xs={12} md={3}>
          <Card>
            <CardContent>
              <Typography>Completed</Typography>
              <Typography variant="h5">{completedTasks}</Typography>
            </CardContent>
          </Card>
        </Grid>
        <Grid item xs={12} md={3}>
          <Card>
            <CardContent>
              <Typography>Pending</Typography>
              <Typography variant="h5">{pendingTasks}</Typography>
            </CardContent>
          </Card>
        </Grid>
        <Grid item xs={12} md={3}>
          <Card>
            <CardContent>
              <Typography>Completion %</Typography>
              <Typography
                variant="h5"
                color={completionPercent >= 80 ? "green" : "orange"}
              >
                {completionPercent}%
              </Typography>
            </CardContent>
          </Card>
        </Grid>
      </Grid>

      {/* ================= TASK EXECUTION ================= */}
      <Typography variant="h6" mb={2}>
        Task Execution
      </Typography>

        {tasks.length === 0 ? (
  <Typography>No tasks available</Typography>
) : (
      <Grid container spacing={2} mb={4}>

        {tasks.map((task) => (
          <Grid item xs={12} md={6} key={task.task_id}>
            <Card>
              <CardContent>
                <Typography fontWeight={600}>{task.title}</Typography>
                <Typography variant="body2">
                  {task.location_id} • {task.scheduled_datetime}
                </Typography>

                <Chip
                  label={task.status}
                  size="small"
                  sx={{ mt: 1 }}
                  color={
                    task.status === "Completed"
                      ? "success"
                      : task.status === "In_Progress"
                      ? "info"
                      : "warning"
                  }
                />

                <Box mt={2} display="flex" gap={1}>
                  {task.status === "Pending" && (
<Button
  size="small"

                      variant="contained"
                      onClick={() => startTask(task.task_id)}
                    >
                      Start
                    </Button>
                  )}
                  {task.status === "In Progress" && (
                    <Button
                      size="small"
                      color="success"
                      variant="contained"
                      onClick={() => completeTask(task.task_id)}
                    >
                      Complete
                    </Button>
                  )}
                </Box>
              </CardContent>
            </Card>
          </Grid>
        ))}
   
      </Grid>
   )}
      {/* ================= INVENTORY HANDLING ================= */}
      <Typography variant="h6" mb={2}>
        Inventory Handling
      </Typography>

      <Grid container spacing={2} mb={4}>
        {inventory.map((item) => (
          <Grid item xs={12} md={6} key={item.id}>
            <Card>
              <CardContent>
                <Typography fontWeight={600}>
  {item.name}
</Typography>
                <Typography variant="body2">
                  Available: {item.quantity} {item.unit}
                </Typography>

                <Divider sx={{ my: 2 }} />

                <Box display="flex" gap={1}>
                  <TextField
                    size="small"
                    type="number"
                    defaultValue={1}
                    inputProps={{ min: 1 }}
                    id={`qty-${item.id}`}
                  />
                  <Button
  size="small"
  variant="contained"
  disabled={item.quantity <= 0}
  onClick={() =>
    consumeItem(
      item,
      Number(
        document.getElementById(
          `qty-${item.id}`
        ).value
      )
    )
  }
>
  Consume
</Button>
                </Box>
              </CardContent>
            </Card>
          </Grid>
        ))}
      </Grid>

      {/* ================= INVENTORY USAGE HISTORY ================= */}
      <Card>
        <CardContent>
          <Typography fontWeight={600} mb={2}>
            Inventory Usage History
          </Typography>

          {inventoryHistory.length === 0 ? (
  <Typography>No inventory usage yet.</Typography>
) : (
  inventoryHistory.map((history) => (
    <Box key={history.history_id} mb={1}>
      <Typography variant="body2">
        {history.item_name} - Used {history.quantity_used}
      </Typography>

      <Typography variant="caption">
        {new Date(history.used_at).toLocaleString()}
      </Typography>
    </Box>
  ))
)}
        </CardContent>
      </Card>
    </Box>
  );
}

import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  Box,
  Typography,
  Chip,
  IconButton,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  List,
  ListItem,
  TextField,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
} from "@mui/material";
import WarningIcon from "@mui/icons-material/Warning";
import InfoIcon from "@mui/icons-material/Info";
import NotificationsActiveIcon from "@mui/icons-material/NotificationsActive";
import VisibilityIcon from "@mui/icons-material/Visibility";
import SendIcon from "@mui/icons-material/Send";

/* ---------------- WORKER CONTEXT ---------------- */
// const worker = {
//   name: "Helper – Ramesh",
//   role: "Helper",
// };

// /* ---------------- SAMPLE ALERTS (WORKER VIEW) ---------------- */
// const initialAlerts = [
//   {
//     id: "ALT-101",
//     direction: "SUPERVISOR_TO_USER",
//     from: "Supervisor",
//     to: "Helper – Ramesh",
//     type: "Warning",
//     title: "Late Clock-In",
//     message: "You clocked in late today. Please be on time.",
//     date: "2025-12-05",
//     status: "Unread",
//   },
//   {
//     id: "ALT-102",
//     direction: "SYSTEM",
//     from: "System",
//     to: "Helper – Ramesh",
//     type: "Info",
//     title: "Attendance Marked",
//     message: "Your attendance has been recorded successfully.",
//     date: "2025-12-04",
//     status: "Read",
//   },
// ];

/* ---------------- HELPERS ---------------- */
const alertColor = (type) => {
  if (type === "Warning") return "warning";
  if (type === "Info") return "info";
  return "default";
};

const alertIcon = (type) => {
  if (type === "Warning") return <WarningIcon />;
  if (type === "Info") return <InfoIcon />;
  return <NotificationsActiveIcon />;
};

export default function WorkerAlerts() {
  const [alerts, setAlerts] = useState([]);
  const [viewAlert, setViewAlert] = useState(null);
  const [message, setMessage] = useState("");

  /* ---------------- MARK AS READ ---------------- */
const markAsRead = async (id) => {
  try {
    await axios.put(
      `${window.API_BASE}/api/alerts/read/${id}`,
      {},
      {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      }
    );

    fetchAlerts(); // refresh data
  } catch (err) {
    console.error("SEND ERROR:", err.response?.data || err.message);
  }
};

  /* ---------------- SEND ALERT TO SUPERVISOR ---------------- */


  const sendAlertToSupervisor = async () => {
  if (!message.trim()) return;

  try {
    await axios.post(
      window.API_BASE + "/api/alerts/send",
      {
        title: "Message from Worker",
        message,
      },
      {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      }
    );

    setMessage("");
    fetchAlerts();
  } catch (err) {
    console.error("SEND ERROR:", err.response?.data || err.message);
  }
};

  const fetchAlerts = async () => {
  try {
    const res = await axios.get(window.API_BASE + "/api/alerts", {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`,
      },
    });

    // 🔥 map backend → frontend format
const formatted = res.data.map((a) => ({
  id: a.id,

  from:
    a.recipient_role === "SUPERVISOR"
      ? "Supervisor"
      : a.recipient_role || "System",

  title: a.title || "No Title",

  message: a.message || "",

  date: a.date
    ? new Date(a.date).toLocaleDateString()
    : "N/A",

  status: a.status || "Unread",

  type: "Info",
}));

    setAlerts(formatted);
  } catch (err) {
    console.error("SEND ERROR:", err.response?.data || err.message);
  }
};

useEffect(() => {
  fetchAlerts();
}, []);

  return (
    <Box sx={{ p: 4, background: "#f5f7fb", minHeight: "100vh" }}>
      <Typography variant="h4" fontWeight={700} mb={3}>
        My Alerts & Messages
      </Typography>

      {/* ALERT TABLE */}
      {/* <Box component="table" sx={{ width: "100%", borderCollapse: "collapse" }}>
        <Box component="thead" sx={{ background: "#eef2f7" }}>
          <Box component="tr">
            {["ID", "From", "Title", "Date", "Status", "Actions"].map((h) => (
              <Box key={h} component="th" sx={{ p: 1.5, textAlign: "left" }}>
                {h}
              </Box>
            ))}
          </Box>
        </Box>

        <Box component="tbody">
          {alerts.map((a) => (
            <Box key={a.id} component="tr" sx={{ borderBottom: "1px solid #eee" }}>
              <Box component="td" sx={{ p: 1.5 }}>{a.id}</Box>
              <Box component="td" sx={{ p: 1.5 }}>{a.from}</Box>

              <Box component="td" sx={{ p: 1.5 }}>
                <Chip
                  icon={alertIcon(a.type)}
                  label={a.title}
                  color={alertColor(a.type)}
                  size="small"
                />
              </Box>

              <Box component="td" sx={{ p: 1.5 }}>{a.date}</Box>

              <Box component="td" sx={{ p: 1.5 }}>
                <Chip
                  size="small"
                  label={a.status}
                  color={a.status === "Unread" ? "warning" : "success"}
                />
              </Box>

 
              <Box component="td" sx={{ p: 1.5 }}>
                <IconButton
                  onClick={() => {
                    setViewAlert(a);
                    markAsRead(a.id);
                  }}
                >
                  <VisibilityIcon />
                </IconButton>
              </Box>
            </Box>
          ))}
        </Box>
      </Box> */}

      <TableContainer component={Paper} sx={{ mt: 2 }}>
  <Table>
    <TableHead sx={{ background: "#eef2f7" }}>
      <TableRow>
        <TableCell>ID</TableCell>
        <TableCell>From</TableCell>
        <TableCell>Title</TableCell>
        <TableCell>Date</TableCell>
        <TableCell>Status</TableCell>
        <TableCell>Actions</TableCell>
      </TableRow>
    </TableHead>

    <TableBody>
      {alerts.map((a) => (
        <TableRow key={a.id}>
          <TableCell>{a.id}</TableCell>

          <TableCell>{a.from}</TableCell>

          <TableCell>
            <Chip
              icon={alertIcon(a.type)}
              label={a.title}
              color={alertColor(a.type)}
              size="small"
            />
          </TableCell>

          <TableCell>{a.date}</TableCell>

          <TableCell>
            <Chip
              size="small"
              label={a.status}
              color={a.status === "Unread" ? "warning" : "success"}
            />
          </TableCell>

          <TableCell>
            <IconButton
              onClick={() => {
                setViewAlert(a);
                markAsRead(a.id);
              }}
            >
              <VisibilityIcon />
            </IconButton>
          </TableCell>
        </TableRow>
      ))}
    </TableBody>
  </Table>
</TableContainer>

      {/* SEND MESSAGE */}
      <Box sx={{ mt: 4 }}>
        <Typography variant="h6" fontWeight={700} mb={1}>
          Send Message to Supervisor
        </Typography>

        <TextField
          fullWidth
          multiline
          rows={3}
          label="Write your message"
          value={message}
          onChange={(e) => setMessage(e.target.value)}
        />

        <Button
          variant="contained"
          startIcon={<SendIcon />}
          sx={{ mt: 2 }}
          onClick={sendAlertToSupervisor}
        >
          Send
        </Button>
      </Box>

      {/* VIEW ALERT */}
      <Dialog open={!!viewAlert} onClose={() => setViewAlert(null)} fullWidth>
        <DialogTitle>Alert Details</DialogTitle>
        <DialogContent dividers>
          {viewAlert && (
            <List>
              <ListItem><b>From:</b> {viewAlert.from}</ListItem>
              <ListItem><b>Title:</b> {viewAlert.title}</ListItem>
              <ListItem><b>Message:</b> {viewAlert.message}</ListItem>
              <ListItem><b>Date:</b> {viewAlert.date}</ListItem>
              <ListItem><b>Status:</b> {viewAlert.status}</ListItem>
            </List>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setViewAlert(null)}>Close</Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

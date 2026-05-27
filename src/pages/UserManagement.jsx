/**
 * WORKER TEAM VIEW (STRICT READ ONLY)
 *
 * ✔ Worker can ONLY view team members
 * ✔ View worker details in dialog
 * ❌ No edit / delete / create
 * ✔ Clean Material UI design
 */

import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  Box,
  Card,
  CardContent,
  Typography,
  Chip,
  IconButton,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
} from "@mui/material";

import VisibilityIcon from "@mui/icons-material/Visibility";

// const cardStyle = {
//   borderRadius: "16px",
//   padding: "16px",
//   boxShadow: "0 4px 20px rgba(0,0,0,0.05)",
//   background: "#ffffff",
// };

// /* -------- CURRENT WORKER -------- */
// const currentWorker = {
//   name: "Ravi Kumar",
//   role: "Helper",
//   colo: "COLO B / Hall 1",
// };

// /* -------- TEAM MEMBERS -------- */
// const teamMembers = [
//   {
//     id: 1,
//     name: "Ravi Kumar",
//     role: "Helper",
//     phone: "9876543210",
//     colo: "COLO B / Hall 1",
//     status: "Active",
//     lastAttendance: "2025-12-11",
//   },
//   {
//     id: 2,
//     name: "Manoj Singh",
//     role: "Helper",
//     phone: "9876123456",
//     colo: "COLO B / Hall 3",
//     status: "Active",
//     lastAttendance: "2025-12-10",
//   },
//   {
//     id: 3,
//     name: "Suresh Das",
//     role: "Supervisor",
//     phone: "9876001122",
//     colo: "COLO B / Hall 2",
//     status: "Active",
//     lastAttendance: "2025-12-11",
//   },
// ];

export default function WorkerTeamView() {
  const [openView, setOpenView] = useState(false);
  const [selectedWorker, setSelectedWorker] = useState(null);

  const [cardStyle, setCardStyle] = useState({

  });
  const [currentWorker, setCurrentWorker] = useState(null);
const [teamMembers, setTeamMembers] = useState([]);
  const openViewDialog = (worker) => {
    setSelectedWorker(worker);
    setOpenView(true);
  };

  const closeViewDialog = () => {
    setOpenView(false);
    setSelectedWorker(null);
  };

  useEffect(() => {
  fetchData();
}, []);

const fetchData = async () => {
  try {
    const token = localStorage.getItem("token");

    const headers = {
      Authorization: `Bearer ${token}`,
    };

    const profileRes = await axios.get(
      "http://localhost:8000/api/users/supervisor/profile",
      { headers }
    );

    const teamRes = await axios.get(
      "http://localhost:8000/api/users/supervisor/helpers",
      { headers }
    );

    console.log("TEAM ARRAY:", teamRes.data.data);

    setTeamMembers(
      Array.isArray(teamRes.data.data)
        ? teamRes.data.data
        : []
    );

    setCurrentWorker({
      ...profileRes.data.data,
      colo: profileRes.data.data.location,
    });

  } catch (error) {
    console.error("API ERROR:", error.response || error.message);
  }
};
  return (
    <Box sx={{ background: "#e8f1ff", minHeight: "100vh", p: 3 }}>
      <Typography variant="h4" fontWeight={700} mb={3}>
        My Team
      </Typography>

      {/* CURRENT WORKER INFO */}
      <Card sx={{ ...cardStyle, mb: 3 }}>
        <CardContent>
          <Typography variant="h6" mb={1}>
            My Details
          </Typography>
{!currentWorker ? (
  <Typography>Loading...</Typography>
) : (
  <>
    <Typography><strong>Name:</strong> {currentWorker.name}</Typography>
    <Typography><strong>Role:</strong> {currentWorker.role}</Typography>
    <Typography><strong>COLO:</strong> {currentWorker.colo}</Typography>
  </>
)}
 </CardContent>
      </Card>

      {/* TEAM TABLE */}
      <Card sx={cardStyle}>
        <CardContent>
          <Typography variant="h6" mb={2}>
            Team Members
          </Typography>

          <Box
            component="table"
            sx={{
              width: "100%",
              borderCollapse: "collapse",
              "& th, td": {
                border: "1px solid #e0e0e0",
                padding: "12px",
                textAlign: "left",
              },
              "& th": {
                background: "#f5f5f5",
                fontWeight: 600,
              },
            }}
          >
            <thead>
              <tr>
                <th>Name</th>
                <th>Role</th>
                <th>COLO</th>
                <th>Status</th>
                <th>Last Attendance</th>
                <th>View</th>
              </tr>
            </thead>

            <tbody>
  {teamMembers.length === 0 ? (
    <tr>
      <td colSpan="6" style={{ textAlign: "center" }}>
        No team members found
      </td>
    </tr>
  ) : (
    teamMembers.map((member) => (
      <tr key={member.id}>
        <td>{member.name}</td>
        <td>{member.role || "N/A"}</td>
        <td>{member.colo}</td>
        <td>
          <Chip
            label={member.status}
            size="small"
            color={member.status === "Active" ? "success" : "default"}
          />
        </td>
        <td>{member.lastAttendance || "No Data"}</td>
        <td>
          <IconButton
            aria-label="View details"
            onClick={() => openViewDialog(member)}
          >
            <VisibilityIcon fontSize="small" />
          </IconButton>
        </td>
      </tr>
    ))
  )}
</tbody>
          </Box>
        </CardContent>
      </Card>

      {/* VIEW ONLY DIALOG */}
      <Dialog open={openView} onClose={closeViewDialog} maxWidth="sm" fullWidth>
        <DialogTitle>Worker Details</DialogTitle>

        <DialogContent dividers>
          {selectedWorker && (
            <Box>
              <Typography><strong>Name:</strong> {selectedWorker.name}</Typography>
              <Typography><strong>Role:</strong> {selectedWorker.role}</Typography>
              <Typography><strong>Phone:</strong> {selectedWorker.phone}</Typography>
              <Typography><strong>COLO:</strong> {selectedWorker.colo}</Typography>
              <Typography><strong>Status:</strong> {selectedWorker.status}</Typography>
              <Typography>
                <strong>Last Attendance:</strong>{" "}
                {selectedWorker.lastAttendance}
              </Typography>
            </Box>
          )}
        </DialogContent>

        <DialogActions>
          <Button onClick={closeViewDialog}>Close</Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

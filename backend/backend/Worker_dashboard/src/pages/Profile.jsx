import React, { useState } from "react";
import {
  Box,
  Card,
  CardContent,
  Typography,
  Grid,
  Avatar,
  TextField,
  Chip,
  Button,
  Divider,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
} from "@mui/material";

import BadgeIcon from "@mui/icons-material/Badge";
import EmailIcon from "@mui/icons-material/Email";
import PhoneIcon from "@mui/icons-material/Phone";
import LocationOnIcon from "@mui/icons-material/LocationOn";
import WorkIcon from "@mui/icons-material/Work";
import EditIcon from "@mui/icons-material/Edit";
import SaveIcon from "@mui/icons-material/Save";
import LockIcon from "@mui/icons-material/Lock";
import HistoryIcon from "@mui/icons-material/History";

/* ---------------- WORKER DATA ---------------- */
const mockWorker = {
  name: "Ravi Kumar",
  role: "Helper",
  email: "ravi.kumar@example.com",
  phone: "+91 98765 43210",
  employeeId: "EMP-101",
  location: "Hyderabad, Telangana",
  colo: "COLO A",
  shift: "09:00 AM – 06:00 PM",
  joinedOn: "2023-04-15",
  profilePic: "",

  loginHistory: [
    { date: "2025-12-06 09:12 AM", device: "Chrome - Windows" },
    { date: "2025-12-05 08:54 PM", device: "Mobile - Android" },
  ],
};

export default function WorkerProfile() {
  const [user, setUser] = useState(mockWorker);
  const [isEditing, setIsEditing] = useState(false);
  const [passwordDialog, setPasswordDialog] = useState(false);
  const [newPassword, setNewPassword] = useState("");

  /* ---------------- IMAGE UPLOAD ---------------- */
  const handleImageUpload = (e) => {
    const file = e.target.files[0];
    if (file) {
      setUser((p) => ({ ...p, profilePic: URL.createObjectURL(file) }));
    }
  };

  const handleChange = (field, value) => {
    setUser((p) => ({ ...p, [field]: value }));
  };

  const handleSave = () => {
    setIsEditing(false);
    alert("Profile updated successfully");
  };

  return (
    <Box sx={{ background: "#e6f0ff", minHeight: "100vh", p: 3 }}>
      <Box
        sx={{
          maxWidth: 900,
          mx: "auto",
          p: 3,
          bgcolor: "white",
          borderRadius: 3,
        }}
      >
        {/* HEADER */}
        <Box sx={{ display: "flex", justifyContent: "space-between", mb: 3 }}>
          <Box sx={{ display: "flex", gap: 2 }}>
            <label htmlFor="upload-photo">
              <Avatar
                src={user.profilePic}
                sx={{ width: 80, height: 80, cursor: "pointer", bgcolor: "#1e88e5" }}
              >
                {!user.profilePic && user.name[0]}
              </Avatar>
            </label>

            <input
              id="upload-photo"
              type="file"
              accept="image/*"
              hidden
              onChange={handleImageUpload}
            />

            <Box>
              <Typography variant="h5" fontWeight={700}>
                {user.name}
              </Typography>

              <Box sx={{ display: "flex", gap: 1, mt: 1 }}>
                <Chip icon={<WorkIcon />} label={user.role} size="small" />
                <Chip icon={<BadgeIcon />} label={user.employeeId} size="small" />
              </Box>
            </Box>
          </Box>

          <Button
            variant={isEditing ? "contained" : "outlined"}
            startIcon={isEditing ? <SaveIcon /> : <EditIcon />}
            onClick={isEditing ? handleSave : () => setIsEditing(true)}
          >
            {isEditing ? "Save" : "Edit"}
          </Button>
        </Box>

        <Divider sx={{ mb: 3 }} />

        {/* DETAILS */}
        <Grid container spacing={3}>
          <Grid item xs={12} md={6}>
            <Card>
              <CardContent>
                <Typography fontWeight={600} mb={2}>
                  Personal Info
                </Typography>

                <TextField
                  label="Email"
                  fullWidth
                  size="small"
                  value={user.email}
                  InputProps={{ readOnly: true }}
                  sx={{ mb: 2 }}
                />

                <TextField
                  label="Phone"
                  fullWidth
                  size="small"
                  value={user.phone}
                  onChange={(e) => handleChange("phone", e.target.value)}
                  InputProps={{ readOnly: !isEditing }}
                  sx={{ mb: 2 }}
                />

                <TextField
                  label="Location"
                  fullWidth
                  size="small"
                  value={user.location}
                  onChange={(e) => handleChange("location", e.target.value)}
                  InputProps={{ readOnly: !isEditing }}
                />
              </CardContent>
            </Card>
          </Grid>

          <Grid item xs={12} md={6}>
            <Card>
              <CardContent>
                <Typography fontWeight={600} mb={2}>
                  Work Info
                </Typography>

                <TextField
                  label="Assigned COLO"
                  fullWidth
                  size="small"
                  value={user.colo}
                  InputProps={{ readOnly: true }}
                  sx={{ mb: 2 }}
                />

                <TextField
                  label="Shift"
                  fullWidth
                  size="small"
                  value={user.shift}
                  InputProps={{ readOnly: true }}
                  sx={{ mb: 2 }}
                />

                <TextField
                  label="Joined On"
                  fullWidth
                  size="small"
                  value={user.joinedOn}
                  InputProps={{ readOnly: true }}
                />
              </CardContent>
            </Card>
          </Grid>
        </Grid>

        {/* LOGIN HISTORY */}
        <Card sx={{ mt: 3 }}>
          <CardContent>
            <Typography fontWeight={700} mb={2}>
              <HistoryIcon sx={{ mr: 1 }} />
              Login History
            </Typography>

            {user.loginHistory.map((h, i) => (
              <Typography key={i}>
                • {h.date} — <b>{h.device}</b>
              </Typography>
            ))}
          </CardContent>
        </Card>

        {/* CHANGE PASSWORD */}
        <Button
          variant="outlined"
          fullWidth
          sx={{ mt: 3 }}
          startIcon={<LockIcon />}
          onClick={() => setPasswordDialog(true)}
        >
          Change Password
        </Button>

        <Dialog open={passwordDialog} onClose={() => setPasswordDialog(false)}>
          <DialogTitle>Change Password</DialogTitle>
          <DialogContent>
            <TextField
              type="password"
              label="New Password"
              fullWidth
              value={newPassword}
              onChange={(e) => setNewPassword(e.target.value)}
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={() => setPasswordDialog(false)}>Cancel</Button>
            <Button variant="contained" onClick={() => setPasswordDialog(false)}>
              Update
            </Button>
          </DialogActions>
        </Dialog>
      </Box>
    </Box>
  );
}

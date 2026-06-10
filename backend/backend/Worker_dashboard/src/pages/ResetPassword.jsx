import React, { useState } from "react";
import axios from "axios";
import { useParams, useNavigate } from "react-router-dom";

import {
  Box,
  Card,
  CardContent,
  TextField,
  Button,
  Typography,
  Avatar,
} from "@mui/material";

export default function ResetPassword() {

  const { token } = useParams();
  const navigate = useNavigate();

  const [password, setPassword] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {

      const res = await axios.post(
        `${window.API_BASE}/api/auth/reset-password/${token}`,
        { password }
      );

      alert(res.data.message);

      navigate("/login");

    } catch (err) {

      alert(
        err.response?.data?.message ||
        err.response?.data?.error ||
        "Reset failed"
      );
    }
  };

  return (
    <Box
      sx={{
        minHeight: "100vh",
        bgcolor: "#e6f0ff",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <Card sx={{ width: 420, borderRadius: 4 }}>
        <CardContent sx={{ p: 4 }}>

          <Box sx={{ display: "flex", justifyContent: "center", mb: 2 }}>
            <Avatar sx={{ bgcolor: "#1E88E5", width: 56, height: 56 }}>
              DC
            </Avatar>
          </Box>

          <Typography
            variant="h5"
            align="center"
            sx={{ fontWeight: 600, mb: 3 }}
          >
            Reset Password
          </Typography>

          <Box component="form" onSubmit={handleSubmit}>

            <TextField
              fullWidth
              type="password"
              label="New Password"
              margin="normal"
              required
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />

            <Button
              fullWidth
              type="submit"
              variant="contained"
              sx={{
                mt: 2,
                py: 1.2,
                bgcolor: "#1E88E5"
              }}
            >
              Reset Password
            </Button>

          </Box>
        </CardContent>
      </Card>
    </Box>
  );
}
import React, { useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import ResetPassword from "./ResetPassword";

import {
  Box,
  Card,
  CardContent,
  TextField,
  Button,
  Typography,
  Avatar,

} from "@mui/material";

export default function ForgotPassword() {
const handleSubmit = async (e) => {
  e.preventDefault();

  try {
    const res = await axios.post(
      "http://localhost:8000/api/auth/forgot-password",
      { email }
    );

    alert(res.data.message);

    console.log(res.data.resetLink); // for testing

  }catch (err) {
  console.log("FULL ERROR:", err);
  console.log("RESPONSE:", err.response);

  alert(err.response?.data?.message || err.message || "Error");
}
};
  const [email, setEmail] = useState("");

  return (
    <Box
      sx={{
        minHeight: "100vh",
        bgcolor: "#e6f0ff",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        p: 2,
      }}
    >
      <Card sx={{ width: 420, borderRadius: 4, boxShadow: 3 }}>
        <CardContent sx={{ p: 4 }}>
          <Box sx={{ display: "flex", justifyContent: "center", mb: 2 }}>
            <Avatar sx={{ bgcolor: "#1E88E5", width: 56, height: 56 }}>
              DC
            </Avatar>
          </Box>

          <Typography variant="h5" align="center" sx={{ fontWeight: 600, mb: 2 }}>
            Forgot Password
          </Typography>

          <Typography align="center" sx={{ mb: 3, color: "gray" }}>
            Enter your email and we will send you a reset link.
          </Typography>

          <Box component="form" onSubmit={handleSubmit}>
<TextField
  fullWidth
  label="Email Address"
  margin="normal"
  type="email"
  required
  value={email}
  onChange={(e) => setEmail(e.target.value)}
/>

            <Button
              fullWidth
              type="submit"
              variant="contained"
              sx={{ mt: 2, py: 1.2, fontWeight: 600, bgcolor: "#1E88E5" }}
            >
              Send Reset Link
            </Button>

            <Typography align="center" sx={{ mt: 2 }}>
              Back to{" "}
            <Link to="/login">Back to Login</Link>

            </Typography>
          </Box>
        </CardContent>
      </Card>
    </Box>
  );
}

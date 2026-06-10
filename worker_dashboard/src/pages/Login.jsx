
import React, { useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";

import {
  Box,
  Card,
  CardContent,
  TextField,
  Button,
  Typography,
} from "@mui/material";

export default function Login({ onLogin }) {

const handleSubmit = async (e) => {
  e.preventDefault();

  try {
    const res = await axios.post(
      window.API_BASE + "/api/users/login",
      {
        email,
        password,
      }
    );

    console.log("LOGIN RESPONSE:", res.data);
    console.log("LOGIN CLICKED");

    // ✅ check success
    if (!res.data.success) {
      alert(res.data.message || "Login failed");
      return;
    }

    // ✅ store token
    localStorage.setItem("token", res.data.token);

    localStorage.setItem(
  "employee_id",
  res.data.user.emp_id
);

    // ✅ FIXED FIELD
    localStorage.setItem("name", res.data.user.username);

    if (onLogin) onLogin();
    console.log("Token stored:", res.data.token);

    // ✅ redirect
   console.log("Navigating to dashboard...");
navigate("/dashboard");

  } catch (err) {
    console.error("Login error:", err.response?.data || err.message);
    alert("Login failed");
  }
};

  const [email, setEmail] = useState("");
const [password, setPassword] = useState("");
const navigate = useNavigate();

  return (
    <Box
      sx={{
        minHeight: "100vh",
        bgcolor: "#a3bfffab",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        p: 2,
      }}
    >
      <Card
        sx={{
          width: 420,
          borderRadius: 4,
          boxShadow: "0px 8px 25px rgba(10, 10, 10, 0.47)",
        }}
      >
        <CardContent sx={{ p: 4 }}>
          
          {/* Title */}
          <Typography
            variant="h4"
            align="center"
            
            sx={{ fontWeight: "bold", mb: 4 }}
          >
            Welcome Back 👋
            
          </Typography>
          <p style={{ textAlign: "center", marginBottom: "16px", fontWeight: "400",mb:4,fontWeight: "bold" }}>Login</p>

          {/* Form */}
          <Box component="form" onSubmit={handleSubmit}>
<TextField
  fullWidth
  margin="normal"
  label="Email or Phone"
  value={email}
  onChange={(e) => setEmail(e.target.value)}
  required
/>

<TextField
  fullWidth
  margin="normal"
  label="Password"
  type="password"
  value={password}
  onChange={(e) => setPassword(e.target.value)}
  required
/>

            <Box
              sx={{
                display: "flex",
                justifyContent: "space-between",
                mt: 1,
                mb: 2,
              }}
            >
              <Link to="/forgot-password" style={{ fontSize: 14 }}>
                Forgot password?
              </Link>
            </Box>

            <Button
              fullWidth
              variant="contained"
              type="submit"
              sx={{
                mt: 1,
                py: 1.4,
                fontWeight: 600,
                fontSize: "1rem",
                bgcolor: "#1E88E5",
                "&:hover": { bgcolor: "#166dbe" },
                borderRadius: "8px",
              }}
            >
              LOGIN
            </Button>

            {/* Signup */}
            <Typography align="center" sx={{ mt: 3 }}>
              Don't have an account?{" "}
              <Link
                to="/signup"
                style={{ textDecoration: "none", color: "#1E88E5" }}
              >
                Create account
              </Link>
            </Typography>
          </Box>
        </CardContent>
      </Card>
    </Box>
  );
}

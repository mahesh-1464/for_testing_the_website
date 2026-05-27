import React, { useState } from "react";
import axios from "axios";
import { useNavigate, Link } from "react-router-dom";


import {
  Box,
  Card,
  CardContent,
  TextField,
  Button,
  Typography,
  Avatar,

} from "@mui/material";

export default function Signup() {
const handleSubmit = async (e) => {
  e.preventDefault();

  if (form.password !== form.confirmPassword) {
    alert("Passwords do not match");
    return;
  }

  try {
    const res = await axios.post(
      "http://localhost:8000/api/users/signup",
      {
        name: form.name,
        email: form.email,
        phone: form.phone,
        password: form.password,
      }
    );

    console.log("Signup success:", res.data);

    alert("Account created successfully");

    // redirect to login
    navigate("/login");

  } catch (err) {
    console.error("Signup error:", err.response?.data || err.message);
    alert("Signup failed");
  }
};

  const navigate = useNavigate();

const [form, setForm] = useState({
  name: "",
  email: "",
  phone: "",
  password: "",
  confirmPassword: "",
});

const handleChange = (e) => {
  setForm({
    ...form,
    [e.target.name]: e.target.value,
  });
};

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

          <Typography variant="h5" align="center" sx={{ fontWeight: 600, mb: 3 }}>
            Create Account
          </Typography>

          <Box component="form" onSubmit={handleSubmit}>
{/* // Form fields will go here */}
<TextField
  fullWidth
  label="Full Name"
  margin="normal"
  name="name"
  value={form.name}
  onChange={handleChange}
  required
/>
{/* // ... other fields like email, phone, password, confirm password */}
<TextField
  fullWidth
  label="Email"
  margin="normal"
  type="email"
  name="email"
  value={form.email}
  onChange={handleChange}
  required
/>
{/* // ... other fields like phone, password, confirm password */}
<TextField 
  fullWidth
  label="Phone Number"
  margin="normal"
  name="phone"
  value={form.phone}
  onChange={handleChange}
  required
/>
    {/* //  ... other fields like email, password, confirm password */}
<TextField
  fullWidth
  label="Password"
  type="password"
  margin="normal"
  name="password"
  value={form.password}
  onChange={handleChange}
  required
/>
{/* //  ... other fields like email, phone, confirm password   */}
<TextField
  fullWidth
  label="Confirm Password"
  type="password"
  margin="normal"
  name="confirmPassword"
  value={form.confirmPassword}
  onChange={handleChange}
  required
/>

            <Button
              fullWidth
              type="submit"
              variant="contained"
              sx={{ mt: 2, py: 1.2, fontWeight: 600, bgcolor: "#1E88E5" }}
            >
              Sign Up
            </Button>

            <Typography align="center" sx={{ mt: 2 }}>
              Already have an account?{" "}
              <Link to="/login">Login</Link>

            </Typography>
          </Box>
        </CardContent>
      </Card>
    </Box>
  );
}

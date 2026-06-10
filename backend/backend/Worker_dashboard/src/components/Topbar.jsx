// src/components/Topbar.jsx
import React, { useState } from "react";
import {
  AppBar,
  Toolbar,
  Typography,
  Box,
  Avatar,
  Menu,
  MenuItem,
  IconButton,
} from "@mui/material";

import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import { useNavigate } from "react-router-dom";
import LogoutIcon from "@mui/icons-material/Logout";

export default function Topbar() {
  const navigate = useNavigate();
  const [anchorEl, setAnchorEl] = useState(null);

  const handleMenuOpen = (e) => setAnchorEl(e.currentTarget);
  const handleMenuClose = () => setAnchorEl(null);

  const goProfile = () => {
    handleMenuClose();
    navigate("/profile");
  };

const handleLogout = () => {
  localStorage.clear();
  window.location.href = "/login";
};


  return (
    <AppBar
      elevation={0}
      position="fixed"
      sx={{
        ml: "240px",
        background: "white",
        color: "#111",
        boxShadow: "0px 2px 10px rgba(0,0,0,0.08)",
        borderBottom: "1px solid #e5e7eb",
      }}
    >
      <Toolbar sx={{ display: "flex", alignItems: "center" }}>
        <Typography variant="h6" sx={{ flexGrow: 1, fontWeight: 700 }}>
          Dashboard
        </Typography>

        {/* Avatar Button */}
        <IconButton onClick={handleMenuOpen}>
          <Avatar
            sx={{
              bgcolor: "#1E88E5",
              width: 40,
              height: 40,
              cursor: "pointer",
            }}
          >
            <AccountCircleIcon sx={{ fontSize: 35, color: "white" }} />
          </Avatar>
        </IconButton>

        {/* Menu */}
        <Menu
          anchorEl={anchorEl}
          open={Boolean(anchorEl)}
          onClose={handleMenuClose}
          anchorOrigin={{ vertical: "bottom", horizontal: "right" }}
          transformOrigin={{ vertical: "top", horizontal: "right" }}
        >
          <MenuItem onClick={goProfile}>My Profile</MenuItem>

          <MenuItem onClick={handleLogout} sx={{ color: "red", fontWeight: 600 }}>
            Logout

          </MenuItem>
        </Menu>
      </Toolbar>
    </AppBar>
  );
}

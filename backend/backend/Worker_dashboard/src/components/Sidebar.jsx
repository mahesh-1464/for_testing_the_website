// src/components/Sidebar.jsx
import React from "react";
import {
  Drawer,
  List,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Box,
  Typography,
} from "@mui/material";

import DashboardIcon from "@mui/icons-material/Dashboard";
import GroupIcon from "@mui/icons-material/Group";
import LocationCityIcon from "@mui/icons-material/LocationCity";
import TaskIcon from "@mui/icons-material/Task";
import InventoryIcon from "@mui/icons-material/Inventory";
import AssessmentIcon from "@mui/icons-material/Assessment";
import NotificationsIcon from "@mui/icons-material/Notifications";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import { NavLink } from "react-router-dom";
import { label } from "framer-motion/client";

const drawerWidth = 240;

const sections = [
  {
    title: "  -------------------------------",
    items: [
      { label: "Dashboard", icon: <DashboardIcon />, to: "/dashboard" },
      { label: "User Management", icon: <GroupIcon />, to: "/users" },
      { label: "Workers", icon: <GroupIcon />, to: "/workermanagement" },
    ],
  },
  {
    title: "--------------------------------",
    items: [
      { label: "Locations", icon: <LocationCityIcon />, to: "/locations" },
      { label: "Inventory", icon: <InventoryIcon />, to: "/inventory" },
      { label: "Tasks", icon: <TaskIcon />, to: "/tasks" },
    
      { label: "Attendance", icon: <TaskIcon />, to: "/attendance" },
    ],
  },
  {  
    title: "--------------------------------",
    items: [

      
      { label: "Feedback", icon: <AssessmentIcon />, to: "/feedback" },
      { label: "Reports", icon: <AssessmentIcon />, to: "/reports" },
      { label: "Alerts", icon: <NotificationsIcon />, to: "/alerts" },
    ],
  },
];

export default function Sidebar() {
  return (
    <Drawer
      variant="permanent"
      sx={{
        width: drawerWidth,
        flexShrink: 0,
        "& .MuiDrawer-paper": {
          width: drawerWidth,
          boxSizing: "border-box",
          backgroundColor: "#070F2B",
          color: "#fff",
          borderRight: "none",
        },
      }}
    >
      {/* LOGO AREA */}
      <Box sx={{ p: 2, borderBottom: "1px solid rgba(255,255,255,0.1)" }}>
        <Typography variant="h6" sx={{ fontWeight: 700 }}>
          Worker Dashboard
        </Typography>
      </Box>

      {/* MENU SECTIONS */}
      <List sx={{ mt: 1 }}>
        {sections.map((section) => (
          <Box key={section.title} sx={{ mb: 2 }}>
            {/* SECTION TITLE */}
            <Typography
              sx={{
                px: 2,
                py: 1,
                fontSize: "0.75rem",
                fontWeight: 600,
                color: "rgba(255,255,255,0.4)",
                textTransform: "uppercase",
              }}
            >
              {section.title}
            </Typography>

            {/* MENU ITEMS */}
            {section.items.map((item) => (
              <NavLink
                to={item.to}
                key={item.label}
                style={{ textDecoration: "none" }}
              >
                {({ isActive }) => (
                  <ListItemButton
                    sx={{
                      py: 1.3,
                      background: isActive
                        ? "rgba(59,130,246,0.15)"
                        : "transparent",
                      borderLeft: isActive ? "4px solid #3B82F6" : "4px solid transparent",
                      "&:hover": {
                        background: "rgba(255,255,255,0.08)",
                      },
                    }}
                  >
                    <ListItemIcon
                      sx={{
                        color: isActive ? "#3B82F6" : "rgba(255,255,255,0.75)",
                        minWidth: 40,
                      }}
                    >
                      {item.icon}
                    </ListItemIcon>

                    <ListItemText
                      primary={item.label}
                      primaryTypographyProps={{
                        fontSize: "0.95rem",
                        fontWeight: isActive ? 600 : 400,
                        color: isActive ? "#3B82F6" : "rgba(255,255,255,0.75)",
                      }}
                    />
                  </ListItemButton>
                )}
              </NavLink>
            ))}
          </Box>
        ))}
      </List>
    </Drawer>
  );
}

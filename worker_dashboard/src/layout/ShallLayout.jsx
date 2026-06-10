// src/layout/ShallLayout.jsx
import React from "react";
import { Box } from "@mui/material";
import Sidebar from "../components/Sidebar";
import Topbar from "../components/Topbar";

export default function ShallLayout({ children }) {
  return (
    <Box sx={{ display: "flex" }}>
      {/* Sidebar (fixed) */}
      <Sidebar />

      {/* Main area */}
      <Box sx={{ flexGrow: 1 }}>
        {/* Topbar (fixed) */}
        <Topbar />

        {/* Page content (below Topbar) */}
        <Box
          component="main"
          sx={{
            mt: "80px",      // reserve space for AppBar
            p: 3,
            bgcolor: "#f7f9fc",
            minHeight: "100vh",
          }}
        >
          {children}
        </Box>
      </Box>
    </Box>
  );
}

import React from "react";
import { Box, Typography } from "@mui/material";

import AdminMap from "../components/location/AdminMap";

export default function LocationsManagement() {
  return (
    <Box
      sx={{
        p: 3,
        backgroundColor: "#f4f7fb",
        minHeight: "100vh",
      }}
    >
      <Typography
        variant="h4"
        sx={{
          mb: 3,
          fontWeight: "bold",
        }}
      >
        Live Worker Locations
      </Typography>

      <Box
        sx={{
          backgroundColor: "white",
          borderRadius: 3,
          p: 2,
          boxShadow: "0 4px 20px rgba(0,0,0,0.08)",
        }}
      >
        <AdminMap />
      </Box>
    </Box>
  );
}
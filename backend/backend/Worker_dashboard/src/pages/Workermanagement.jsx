/**
 * WORKER TEAM VIEW (READ ONLY)
 *
 * ✔ Worker can view team members
 * ✔ View worker details
 * ❌ No edit / update / actions
 */

import React, { useEffect, useState, useMemo} from "react";
import axios from "axios";
import {
  Box,
  Typography,
  TextField,
  Avatar,
  Chip,
  IconButton,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  Grid,
  Rating,
  Divider,
} from "@mui/material";

import VisibilityIcon from "@mui/icons-material/Visibility";

/* ================= WORKER CONTEXT ================= */
// const workerContext = {
//   name: "Ravi Kumar",
//   colo: "COLO A",
// };

// /* ================= WORKER DATA ================= */
// const initialWorkers = [
//   {
//     id: "WRK-101",
//     name: "Ravi Kumar",
//     role: "Helper",
//     vendor: "Delightech Vendor Services",
//     colo: "COLO A",
//     hall: "Hall 1",
//     status: "Active",
//     rating: 4.2,
//     documents: [
//       { name: "Aadhar Card", status: "Verified" },
//       { name: "Police Verification", status: "Pending" },
//     ],
//   },
//   {
//     id: "WRK-102",
//     name: "Suresh Das",
//     role: "Helper",
//     vendor: "Delightech Vendor Services",
//     colo: "COLO A",
//     hall: "Hall 2",
//     status: "Active",
//     rating: 3.6,
//     documents: [{ name: "Aadhar Card", status: "Verified" }],
//   },
// ];

/* ================= MAIN COMPONENT ================= */
export default function WorkerTeamView() {
const [search, setSearch] = useState("");
const [workers, setWorkers] = useState([]);
const [openView, setOpenView] = useState(false);
const [selectedWorker, setSelectedWorker] = useState(null);

const [workerContext, setWorkerContext] = useState({
  colo: "COLO A",
  // colo: "COLO-B",
  // colo: "COLO-C",
  // colo: "COLO-D",
});


const visibleWorkers = useMemo(() => {
  return workers.filter((w) => {

const matchesSearch =
  w.name?.toLowerCase().includes(search.toLowerCase()) ||
  w.id?.toLowerCase().includes(search.toLowerCase()) ||
  w.hall?.toLowerCase().includes(search.toLowerCase());

    return matchesSearch;
  });
}, [search, workers]);
  /* ================= FILTER ================= */


  const openViewDialog = (worker) => {
    setSelectedWorker(worker);
    setOpenView(true);
  };

  const closeViewDialog = () => {
    setOpenView(false);
    setSelectedWorker(null);
  };

  useEffect(() => {
  const fetchWorkers = async () => {
    
    try {
const res = await axios.get(window.API_BASE + "/api/workers");
console.log("API DATA:", res.data);
      if (res.data.success) {
        setWorkers(res.data.data);
      }
    } catch (err) {
      console.error("API ERROR:", err);
    }
  };

  fetchWorkers();
}, []);

  return (
    <Box sx={{ p: 3, background: "#e6f0ff", minHeight: "100vh" }}>
      <Box
        sx={{
          maxWidth: "1100px",
          mx: "auto",
          p: 3,
          background: "white",
          borderRadius: "20px",
          boxShadow: "0 4px 18px rgba(0,0,0,0.08)",
        }}
      >
        <Typography variant="h4" fontWeight={800} mb={3}>
          My Team ({workerContext.colo})
        </Typography>

        {/* SEARCH */}
        <Grid container spacing={2} sx={{ mb: 3 }}>
          <Grid item xs={12} md={6}>
            <TextField
              fullWidth
              size="small"
              label="Search team member..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </Grid>
        </Grid>

        {/* TABLE */}
        <Box component="table" sx={{ width: "100%", borderCollapse: "collapse" }}>
          <Box component="thead" sx={{ bgcolor: "#f0f3fa" }}>
            <Box component="tr">
              {["ID", "Name", "Location", "Rating", "Status", "View"].map(
                (h) => (
                  <Box key={h} component="th" sx={{ p: 1.5, fontWeight: 700 }}>
                    {h}
                  </Box>
                )
              )}
            </Box>
          </Box>

          <Box component="tbody">
            {visibleWorkers.map((w) => (
              <Box
                component="tr"
                key={w.id}
                sx={{ borderBottom: "1px solid #eee" }}
              >
                <Box component="td" sx={{ p: 1.5 }}>{w.id}</Box>

                <Box component="td" sx={{ p: 1.5 }}>
                  <Box sx={{ display: "flex", gap: 1, alignItems: "center" }}>
                    <Avatar>{w.name[0]}</Avatar>
                    {w.name}
                  </Box>
                </Box>

                <Box component="td" sx={{ p: 1.5 }}>
                  {w.colo} / {w.hall}
                </Box>

                <Box component="td" sx={{ p: 1.5 }}>
                  <Rating value={w.rating} readOnly size="small" />
                </Box>

                <Box component="td" sx={{ p: 1.5 }}>
                  <Chip
                    label={w.status}
                    size="small"
                    color={w.status === "Active" ? "success" : "default"}
                  />
                </Box>

                <Box component="td" sx={{ p: 1.5 }}>
                  <IconButton onClick={() => openViewDialog(w)}>
                    <VisibilityIcon />
                  </IconButton>
                </Box>
              </Box>
            ))}

            {visibleWorkers.length === 0 && (
              <Box component="tr">
                <Box
                  component="td"
                  colSpan={6}
                  sx={{ p: 2, textAlign: "center", color: "gray" }}
                >
                  No team members found.
                </Box>
              </Box>
            )}
          </Box>
        </Box>
      </Box>

      {/* VIEW ONLY DIALOG */}
      <Dialog open={openView} onClose={closeViewDialog} maxWidth="sm" fullWidth>
        <DialogTitle>Worker Details</DialogTitle>

        <DialogContent dividers>
          {selectedWorker && (
            <>
              <Typography><strong>Name:</strong> {selectedWorker.name}</Typography>
              <Typography><strong>Role:</strong> {selectedWorker.role}</Typography>
              <Typography><strong>Vendor:</strong> {selectedWorker.vendor}</Typography>
              <Typography><strong>Location:</strong> {selectedWorker.colo} / {selectedWorker.hall}</Typography>

              <Divider sx={{ my: 2 }} />

              <Typography fontWeight={600}>Documents</Typography>
              {selectedWorker.documents?.map((d, idx) => (
                <Typography key={idx}>
                  {d.name} — {d.status}
                </Typography>
              ))}
            </>
          )}
        </DialogContent>

        <DialogActions>
          <Button onClick={closeViewDialog}>Close</Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

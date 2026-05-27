import React, { useEffect, useState, useMemo } from "react";
import axios from "axios";
import {
  Box,
  Card,
  CardContent,
  Typography,
  Grid,
  TextField,
  IconButton,
  Chip,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  Rating,
  Divider,
} from "@mui/material";

import VisibilityIcon from "@mui/icons-material/Visibility";
import CloseIcon from "@mui/icons-material/Close";

/* ---------------- WORKER CONTEXT ---------------- */
// const workerContext = {
//   name: "Ravi Kumar", // logged-in worker
// };

// /* ---------------- DEMO DATA ---------------- */
// const feedbackList = [
//   {
//     id: "FB-101",
//     worker: "Ravi Kumar",
//     task: "Daily Cleaning - COLO A",
//     rating: 4,
//     comment: "Good work, but cleanup took extra time.",
//     givenBy: "Site Engineer",
//     date: "2025-12-02",
//   },
//   {
//     id: "FB-102",
//     worker: "Anita Sharma",
//     task: "Dusting - Hall 2",
//     rating: 5,
//     comment: "Excellent work! Very professional.",
//     givenBy: "Site Manager",
//     date: "2025-12-03",
//   },
// ];

// const suggestions = [
//   {
//     id: "SG-201",
//     title: "Use microfiber cloths for faster cleaning",
//     source: "AI Generated",
//     status: "Under Review",
//     impact: "Pending",
//     date: "2025-12-01",
//   },
//   {
//     id: "SG-202",
//     title: "Schedule aisle cleaning every 3 hours",
//     source: "System",
//     status: "Approved",
//     impact: "Improved cleanliness score",
//     date: "2025-11-28",
//   },
// ];



export default function WorkerFeedback() {
  const [search, setSearch] = useState("");
  const [dialogOpen, setDialogOpen] = useState(false);
  const [selectedItem, setSelectedItem] = useState(null);

  const closeDialog = () => {
  setDialogOpen(false);
  setSelectedItem(null);
};

const [feedbackList, setFeedbackList] = useState([]);
const [suggestions, setSuggestions] = useState([]);

  /* -------- FILTER: ONLY LOGGED-IN WORKER FEEDBACK -------- */
const workerFeedback = useMemo(() => {
  return feedbackList.filter((f) => {
    return (
      f.task?.toLowerCase().includes(search.toLowerCase()) ||
      f.comment?.toLowerCase().includes(search.toLowerCase())
    );
  });
}, [search, feedbackList]);

const filteredSuggestions = useMemo(() => {
  return suggestions.filter((s) =>
    s.title?.toLowerCase().includes(search.toLowerCase())
  );
}, [search, suggestions]);

  const openDialog = (item) => {
    setSelectedItem(item);
    setDialogOpen(true);
  };

const fetchFeedback = async () => {
  
  try {
const res = await api.get("/worker");
console.log("API DATA:", res.data);

    const mapped = res.data.map((f) => ({
      id: f.feedback_id,
      worker: f.worker_name,
      task: f.task_title,
      rating: f.rating,
      givenBy: f.given_by_role,
      date: new Date(f.created_at).toLocaleDateString(),
      comment: f.feedback_notes || "No comments"
    }));

    setFeedbackList(mapped);
  } catch (err) {
    console.error("Feedback error:", err.response?.data || err.message);
  }
};

const token = localStorage.getItem("token");

const api = axios.create({
  baseURL: "http://localhost:8000/api/feedback",
  headers: {
  Authorization: `Bearer ${token}`,
  },
});


const fetchSuggestions = async () => {
  try {

    const res = await axios.get(
      "http://localhost:8000/api/feedback/suggestions",
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    console.log("SUGGESTIONS API RESPONSE:", res.data);

    const mapped = res.data.map((s) => ({
      id: s.id,
      title: s.title,
      source: s.source,
      status: s.status,
      impact: s.impact,
      date: new Date(s.created_at).toLocaleDateString()
    }));

    console.log("MAPPED SUGGESTIONS:", mapped);

    setSuggestions(mapped);

  } catch (err) {

    console.error(
      "Suggestions error:",
      err.response?.data || err.message
    );
  }
};
  useEffect(() => {
  fetchFeedback();
  fetchSuggestions();
}, []);


  

  return (
    <Box sx={{ p: 3, background: "#e6f0ff", minHeight: "100vh" }}>
      <Box
        sx={{
          maxWidth: "1100px",
          mx: "auto",
          p: 3,
          background: "white",
          borderRadius: 3,
          boxShadow: "0 6px 20px rgba(0,0,0,0.06)",
        }}
      >
        <Typography variant="h4" fontWeight={800} mb={3}>
          My Feedback & Suggestions
        </Typography>

        {/* SEARCH */}
        <TextField
          fullWidth
          size="small"
          label="Search feedback or suggestions"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          sx={{ mb: 4 }}
        />

        {/* ---------- MY FEEDBACK ---------- */}
        <Typography variant="h6" fontWeight={700} mb={1}>
          My Feedback
        </Typography>

        <Card sx={{ mb: 4 }}>
          <CardContent>
            <Box component="table" sx={{ width: "100%", borderCollapse: "collapse" }}>
              <thead>
                <tr>
                  {["Task", "Rating", "Given By", "Date", "View"].map((h) => (
                    <th key={h} style={{ padding: 10, textAlign: "left" }}>
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>

              <tbody>
                {workerFeedback.map((f) => (
                  <tr key={f.id} style={{ borderBottom: "1px solid #eee" }}>
                    <td style={{ padding: 10 }}>{f.task}</td>
                    <td style={{ padding: 10 }}>
                      <Rating value={f.rating} readOnly />
                    </td>
                    <td style={{ padding: 10 }}>{f.givenBy}</td>
                    <td style={{ padding: 10 }}>{f.date}</td>
                    <td style={{ padding: 10 }}>
                      <IconButton onClick={() => openDialog(f)}>
                        <VisibilityIcon />
                      </IconButton>
                    </td>
                  </tr>
                ))}
                

                {workerFeedback.length === 0 && (
                  <tr>
                    <td colSpan={5} style={{ padding: 12, textAlign: "center" }}>
                      No feedback available
                    </td>
                  </tr>
                )}
              </tbody>

              
            </Box>
          </CardContent>
        </Card>

        {/* ---------- SUGGESTIONS (READ-ONLY) ---------- */}
        <Typography variant="h6" fontWeight={700} mb={1}>
          System Suggestions
        </Typography>

        <Card>
          <CardContent>
            <Box component="table" sx={{ width: "100%", borderCollapse: "collapse" }}>
              <thead>
                <tr>
                  {["Title", "Source", "Status", "Impact", "View"].map((h) => (
                    <th key={h} style={{ padding: 10, textAlign: "left" }}>
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>

              <tbody>
                {suggestions.map((s) => (
                  <tr key={s.id} style={{ borderBottom: "1px solid #eee" }}>
                    <td style={{ padding: 10 }}>{s.title}</td>
                    <td style={{ padding: 10 }}>{s.source}</td>
                    <td style={{ padding: 10 }}>
                      <Chip
                        label={s.status}
                        size="small"
                        color={
                          s.status === "Approved"
                            ? "success"
                            : s.status === "Under Review"
                            ? "warning"
                            : "default"
                        }
                      />
                    </td>
                    <td style={{ padding: 10 }}>{s.impact}</td>
                    <td style={{ padding: 10 }}>
                      <IconButton onClick={() => openDialog(s)}>
                        <VisibilityIcon />
                      </IconButton>
                    </td>
                  </tr>
                ))}
              </tbody>
              {suggestions.length === 0 && (
  <tr>
    <td
      colSpan={5}
      style={{
        padding: 12,
        textAlign: "center"
      }}
    >
      No suggestions available
    </td>
  </tr>
)}
            </Box>
          </CardContent>
        </Card>

        {/* ---------- VIEW DIALOG ---------- */}
        <Dialog open={dialogOpen} onClose={() => setDialogOpen(false)} maxWidth="sm" fullWidth>
          <DialogTitle sx={{ display: "flex", justifyContent: "space-between" }}>
            Details
            <IconButton onClick={() => setDialogOpen(false)}>
              <CloseIcon />
            </IconButton>
          </DialogTitle>

          <DialogContent dividers>
  {!selectedItem ? (
    <Typography color="text.secondary">
      No details available
    </Typography>
  ) : "rating" in selectedItem ? (
    <>
      {/* FEEDBACK VIEW */}
      <Typography fontWeight={700}>
        {selectedItem.task}
      </Typography>

      <Rating
        value={selectedItem.rating}
        readOnly
        sx={{ my: 1 }}
      />

      <Typography sx={{ mb: 2 }}>
        {selectedItem.comment}
      </Typography>

      <Divider sx={{ my: 2 }} />

      <Typography variant="caption">
        Given by {selectedItem.givenBy} • {selectedItem.date}
      </Typography>
    </>
  ) : (
    <>
      {/* SUGGESTION VIEW */}
      <Typography fontWeight={700}>
        {selectedItem.title}
      </Typography>

      <Typography sx={{ mt: 1 }}>
        <b>Source:</b> {selectedItem.source}
      </Typography>

      <Typography sx={{ mt: 1 }}>
        <b>Status:</b> {selectedItem.status}
      </Typography>

      <Typography sx={{ mt: 1 }}>
        <b>Impact:</b> {selectedItem.impact}
      </Typography>
    </>
  )}
</DialogContent>

          <DialogActions>
            <Button onClick={() => setDialogOpen(false)}>Close</Button>
          </DialogActions>
        </Dialog>
      </Box>
    </Box>
  );
}

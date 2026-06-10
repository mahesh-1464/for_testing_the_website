import React, { useEffect, useState, useMemo } from "react";
import axios from "axios";
import {
  Box,
  Card,
  CardContent,
  Typography,
  TextField,
  Chip,
  IconButton,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  Grid,
  Divider,
} from "@mui/material";

import VisibilityIcon from "@mui/icons-material/Visibility";
import LocalShippingIcon from "@mui/icons-material/LocalShipping";

/* ---------------- WORKER CONTEXT ---------------- */
// const workerContext = {
//   name: "Ravi Kumar",
//   colo: "COLO A",
// };

// /* ---------------- INVENTORY (READ ONLY) ---------------- */
// const initialInventory = [
//   {
//     id: 1,
//     name: "Floor Cleaner 5L",
//     category: "Cleaning Liquid",
//     quantity: 12,
//     minStock: 5,
//     colo: "COLO A",
//     status: "OK",
//     lastUpdated: "2025-12-01",
//     serialNumbers: ["SN-A-001", "SN-A-002"],
//     consumptionLogs: [
//       {
//         when: "2025-12-05T09:10:00",
//         qty: 2,
//         issuedTo: "Ravi Kumar",
//         issuedBy: "Supervisor",
//       },
//     ],
//   },
//   {
//     id: 2,
//     name: "Gloves (Disposable)",
//     category: "Safety",
//     quantity: 0,
//     minStock: 20,
//     colo: "COLO A",
//     status: "Out of Stock",
//     lastUpdated: "2025-11-28",
//     serialNumbers: [],
//     consumptionLogs: [],
//   },
//   {
//     id: 3,
//     name: "Trash Bags",
//     category: "Consumables",
//     quantity: 10,
//     minStock: 10,
//     colo: "COLO B",
//     status: "OK",
//     lastUpdated: "2025-12-02",
//     serialNumbers: [],
//     consumptionLogs: [],
//   },
// ];

function statusColor(status) {
  if (status === "OK") return "success";
  if (status === "Low Stock") return "warning";
  if (status === "Out of Stock") return "error";
  return "default";
}

/* ---------------- WORKER INVENTORY ---------------- */
export default function WorkerInventory() {
  const [inventory, setInventory] = useState([]);

  const [search, setSearch] = useState("");

  const [viewDialog, setViewDialog] = useState(false);
  const [requestDialog, setRequestDialog] = useState(false);

  const [loading, setLoading] = useState(true);
  const [selectedItem, setSelectedItem] = useState(null);
  const [requestQty, setRequestQty] = useState("");

  const workerContext = {
  name: "Ravi Kumar",
  colo: "COLO A",
};
  /* ---------------- ONLY ASSIGNED COLO ---------------- */
  const visibleInventory = useMemo(() => {
    const s = search.toLowerCase();
    return inventory.filter(
      (i) =>
        i.colo === workerContext.colo &&
        (!s ||
          i.name.toLowerCase().includes(s) ||
          i.category.toLowerCase().includes(s))
    );
  }, [inventory, search]);

// const openView = async (item) => {
//   try {
//     const res = await axios.get(`${window.API_BASE}/api/inventory/${item.id}`);

//     console.log("VIEW API:", res.data);

//     const data = res.data.data || res.data;

//     setSelectedItem(data);
//     setViewDialog(true);

//   } catch (err) {
//     console.error("Error fetching item details:", err);
//   }
// };
const openView = (item) => {
  setSelectedItem(item);
  setViewDialog(true);
};

  const openRequest = (item) => {
    setSelectedItem(item);
    setRequestQty("");
    setRequestDialog(true);
  };

  const closeDialogs = () => {
    setSelectedItem(null);
    setViewDialog(false);
    setRequestDialog(false);
  };

const submitRequest = async () => {
  try {
    await axios.post(window.API_BASE + "/api/requests", {
      worker_name: workerContext.name,
      item_id: selectedItem.id,
      quantity: Number(requestQty),
      colo: workerContext.colo,
    });

    alert("Request sent successfully");

    closeDialogs();

  } catch (err) {
    console.error("Request failed:", err);
    alert("Failed to send request");
  }
};

  useEffect(() => {
  fetchInventory();
}, []);

const fetchInventory = async () => {
  try {
    const res = await axios.get(window.API_BASE + "/api/inventory");

    // if your API returns data directly:
    setInventory(res.data.data);

    // if wrapped:
    // setInventory(res.data.data);

  } catch (err) {
    console.error("Error fetching inventory:", err);
  } finally {
    setLoading(false);
  }
};

if (loading) {
  return <Typography>Loading...</Typography>;
}
  return (
    <Box sx={{ background: "#f6f9ff", minHeight: "100vh", p: 3 }}>
      <Box sx={{ maxWidth: 1200, mx: "auto" }}>
        <Typography variant="h4" fontWeight={700} mb={1}>
        Tasks        </Typography>

        <Typography variant="body2" color="text.secondary" mb={2}>
          Assigned COLO: <strong>{workerContext.colo}</strong>
        </Typography>

        {/* SEARCH */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <TextField
              fullWidth
              size="small"
              label="Search Tasks"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </CardContent>
        </Card>

        {/* TABLE */}
        <Card>
          <CardContent>
            <Box component="table" sx={{ width: "100%", borderCollapse: "collapse" }}>
              <Box component="thead" sx={{ bgcolor: "#fafcff" }}>
                <Box component="tr">
                  {["Item", "Category", "Qty", "Status", "Updated", "Actions"].map(
                    (h) => (
                      <Box component="th" key={h} sx={{ p: 1.2, textAlign: "left", fontWeight: 700 }}>
                        {h}
                      </Box>
                    )
                  )}
                </Box>
              </Box>

              <Box component="tbody">
                {visibleInventory.map((item) => (
                  <Box
                    component="tr"
                    key={item.id}
                    sx={{
                      borderBottom: "1px solid #eee",
                      background:
                        item.status === "Out of Stock"
                          ? "#fff1f0"
                          : item.status === "Low Stock"
                          ? "#fffaf0"
                          : "transparent",
                    }}
                  >
                    <Box component="td" sx={{ p: 1.2 }}>{item.name}</Box>
                    <Box component="td" sx={{ p: 1.2 }}>{item.category}</Box>
                    <Box component="td" sx={{ p: 1.2 }}>{item.quantity}</Box>
                    <Box component="td" sx={{ p: 1.2 }}>
                      <Chip label={item.status} size="small" color={statusColor(item.status)} />
                    </Box>
                    <Box component="td" sx={{ p: 1.2 }}>{item.lastUpdated}</Box>
                    <Box component="td" sx={{ p: 1.2 }}>
                      <IconButton onClick={() => openView(item)} size="small">
                        <VisibilityIcon />
                      </IconButton>
                      <IconButton onClick={() => openRequest(item)} size="small">
                        <LocalShippingIcon />
                      </IconButton>
                    </Box>
                  </Box>
                ))}

                {visibleInventory.length === 0 && (
                  <Box component="tr">
                    <Box component="td" colSpan={6} sx={{ p: 2, textAlign: "center", color: "gray" }}>
                      No inventory available for your COLO.
                    </Box>
                  </Box>
                )}
              </Box>
            </Box>
          </CardContent>
        </Card>

        {/* VIEW DIALOG */}
        <Dialog open={viewDialog} onClose={closeDialogs} maxWidth="md" fullWidth>
          <DialogTitle>Item Details</DialogTitle>
          <DialogContent dividers>
            {selectedItem && (
              <Box>
                <Typography><strong>Name:</strong> {selectedItem.name}</Typography>
                <Typography><strong>Category:</strong> {selectedItem.category}</Typography>
                <Typography><strong>Available:</strong> {selectedItem.quantity}</Typography>

                <Divider sx={{ my: 2 }} />

                <Typography variant="h6">Consumption History</Typography>
                {selectedItem.consumptionLogs?.length > 0 ? (
                  selectedItem.consumptionLogs?.map((log, i) => (
                    <Typography key={i} variant="body2">
                      {new Date(log.when).toLocaleString()} — {log.qty} issued to{" "}
                      {log.issuedTo}
                    </Typography>
                  ))
                ) : (
                  <Typography color="text.secondary">No history</Typography>
                )}
              </Box>
            )}
          </DialogContent>
          <DialogActions>
            <Button onClick={closeDialogs}>Close</Button>
          </DialogActions>
        </Dialog>

        {/* REQUEST DIALOG */}
        <Dialog open={requestDialog} onClose={closeDialogs} maxWidth="sm" fullWidth>
          <DialogTitle>Request Item</DialogTitle>
          <DialogContent dividers>
            {selectedItem && (
              <Box>
                <Typography sx={{ mb: 1 }}>
                  <strong>Item:</strong> {selectedItem.name}
                </Typography>

                <TextField
                  fullWidth
                  type="number"
                  label="Requested Quantity"
                  value={requestQty}
                  onChange={(e) => setRequestQty(e.target.value)}
                />

                <Typography variant="body2" color="text.secondary" mt={2}>
                  This request will be sent to your supervisor for approval.
                </Typography>
              </Box>
            )}
          </DialogContent>
          <DialogActions>
            <Button onClick={closeDialogs}>Cancel</Button>
            <Button
              variant="contained"
              onClick={submitRequest}
              disabled={!requestQty || Number(requestQty) <= 0}
            >
              Send Request
            </Button>
          </DialogActions>
        </Dialog>
      </Box>
    </Box>
  );
}

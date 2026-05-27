import React, { useEffect, useState, useMemo } from "react";
import axios from "axios";
import {
  Box,
  Card,
  CardContent,
  Typography,
  TextField,
  MenuItem,
  Chip,
  IconButton,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  Select,
  InputLabel,
  FormControl,
  Grid,
  Divider,
} from "@mui/material";

import VisibilityIcon from "@mui/icons-material/Visibility";

/* ---------------- DEMO INVENTORY (READ ONLY) ---------------- */
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
  //     serialNumbers: ["SN-A-001", "SN-A-002", "SN-A-003"],
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
  //     name: "Trash Bags (Large)",
  //     category: "Consumables",
  //     quantity: 4,
  //     minStock: 10,
  //     colo: "COLO B",
  //     status: "Low Stock",
  //     lastUpdated: "2025-11-30",
  //     serialNumbers: ["TB-B-101"],
  //     consumptionLogs: [],
  //   },
  //   {
  //     id: 3,
  //     name: "Gloves (Disposable)",
  //     category: "Safety",
  //     quantity: 0,
  //     minStock: 20,
  //     colo: "COLO A",
  //     status: "Out of Stock",
  //     lastUpdated: "2025-11-28",
  //     serialNumbers: [],
  //     consumptionLogs: [
  //       {
  //         when: "2025-11-28T08:00:00",
  //         qty: 20,
  //         issuedTo: "Task-Server Dusting",
  //         issuedBy: "Admin",
  //       },
  //     ],
  //   },
  // ];

function statusColor(status) {
  if (status === "OK") return "success";
  if (status === "Low Stock") return "warning";
  if (status === "Out of Stock") return "error";
  return "default";
}

/* ---------------- WORKER INVENTORY VIEW ---------------- */
export default function WorkerInventory() {
  const [inventory, setInventory] = useState([]);

  const [search, setSearch] = useState("");
  const [coloFilter, setColoFilter] = useState("All");

  const [dialogView, setDialogView] = useState(false);
  const [selectedItem, setSelectedItem] = useState(null);

  const [loading, setLoading] = useState(true);
  const colos = useMemo(() => {
    const set = new Set(inventory.map((i) => i.colo));
    return ["All", ...Array.from(set)];
  }, [inventory]);

  const filtered = useMemo(() => {
    const s = search.trim().toLowerCase();
    return inventory.filter((i) => {
      const matchSearch =
        !s ||
        i.name.toLowerCase().includes(s) ||
        i.category.toLowerCase().includes(s) ||
        i.colo.toLowerCase().includes(s);

      const matchColo = coloFilter === "All" || i.colo === coloFilter;
      return matchSearch && matchColo;
    });
  }, [search, coloFilter, inventory]);

  const openView = (item) => {
    setSelectedItem(item);
    setDialogView(true);
  };

  const closeView = () => {
    setSelectedItem(null);
    setDialogView(false);
  };

  const cardStyle = {
    borderRadius: "12px",
    padding: "16px",
    boxShadow: "0 4px 20px rgba(0,0,0,0.04)",
    background: "#ffffff",
  };

useEffect(() => {
  const fetchInventory = async () => {
    try {
      const res = await axios.get("http://localhost:8000/api/inventory");

setInventory(res.data.data);
    } catch (err) {
      console.error("Error:", err);
    } finally {
      setLoading(false);
    }
  };

  fetchInventory();
}, []);
if (loading) {
  return <Typography>Loading inventory...</Typography>;
}
  return (
    <Box sx={{ background: "#f6f9ff", minHeight: "100vh", p: 3 }}>
      <Box sx={{ maxWidth: 1200, mx: "auto" }}>
        <Typography variant="h4" fontWeight={700} mb={2}>
          Inventory — Worker View
        </Typography>

        {/* FILTERS */}
        <Card sx={{ ...cardStyle, mb: 2 }}>
          <CardContent>
            <Grid container spacing={2}>
              <Grid item xs={12} md={6}>
                <TextField
                  fullWidth
                  size="small"
                  label="Search inventory"
                  value={search}
                  onChange={(e) => setSearch(e.target.value)}
                />
              </Grid>

              <Grid item xs={12} md={3}>
                <FormControl fullWidth size="small">
                  <InputLabel>COLO</InputLabel>
                  <Select
                    value={coloFilter}
                    label="COLO"
                    onChange={(e) => setColoFilter(e.target.value)}
                  >
                    {colos.map((c) => (
                      <MenuItem key={c} value={c}>
                        {c}
                      </MenuItem>
                    ))}
                  </Select>
                </FormControl>
              </Grid>
            </Grid>
          </CardContent>
        </Card>

        {/* TABLE */}
        <Card sx={cardStyle}>
          <CardContent>
            <Box component="table" sx={{ width: "100%", borderCollapse: "collapse" }}>
              <Box component="thead" sx={{ bgcolor: "#fafcff" }}>
                <Box component="tr">
                  {[
                    "Item Name",
                    "Category",
                    "Qty",
                    "COLO",
                    "Status",
                    "Last Updated",
                    "View",
                  ].map((h) => (
                    <Box component="th" key={h} sx={{ p: 1.2, textAlign: "left", fontWeight: 700 }}>
                      {h}
                    </Box>
                  ))}
                </Box>
              </Box>

              <Box component="tbody">
                {filtered.map((item) => (
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
                    <Box component="td" sx={{ p: 1.2 }}>{item.colo}</Box>
                    <Box component="td" sx={{ p: 1.2 }}>
                      <Chip label={item.status} size="small" color={statusColor(item.status)} />
                    </Box>
                    <Box component="td" sx={{ p: 1.2 }}>{item.lastUpdated}</Box>
                    <Box component="td" sx={{ p: 1.2 }}>
                      <IconButton onClick={() => openView(item)} size="small">
                        <VisibilityIcon />
                      </IconButton>
                    </Box>
                  </Box>
                ))}

                {filtered.length === 0 && (
                  <Box component="tr">
                    <Box component="td" colSpan={7} sx={{ p: 2, textAlign: "center", color: "gray" }}>
                      No inventory found.
                    </Box>
                  </Box>
                )}
              </Box>
            </Box>
          </CardContent>
        </Card>

        {/* VIEW DIALOG (READ ONLY) */}
        <Dialog open={dialogView} onClose={closeView} maxWidth="md" fullWidth>
          <DialogTitle>Item Details</DialogTitle>
          <DialogContent dividers>
            {selectedItem && (
              <Box>
                <Typography><strong>Name:</strong> {selectedItem.name}</Typography>
                <Typography><strong>Category:</strong> {selectedItem.category}</Typography>
                <Typography><strong>Quantity:</strong> {selectedItem.quantity}</Typography>
                <Typography><strong>COLO:</strong> {selectedItem.colo}</Typography>
                <Typography><strong>Status:</strong> {selectedItem.status}</Typography>
                <Typography><strong>Last Updated:</strong> {selectedItem.lastUpdated}</Typography>

                <Divider sx={{ my: 2 }} />

                <Typography variant="h6">Serial Numbers</Typography>
                {selectedItem.serialNumbers.length > 0 ? (
                  selectedItem.serialNumbers.map((s) => (
                    <Chip key={s} label={s} size="small" sx={{ mr: 1, mt: 1 }} />
                  ))
                ) : (
                  <Typography color="text.secondary">No serials</Typography>
                )}

                <Divider sx={{ my: 2 }} />

                <Typography variant="h6">Consumption History</Typography>
                {selectedItem.consumptionLogs.length > 0 ? (
                  selectedItem.consumptionLogs.map((log, i) => (
                    <Typography key={i} variant="body2">
                      {new Date(log.when).toLocaleString()} — {log.qty} issued to{" "}
                      {log.issuedTo}
                    </Typography>
                  ))
                ) : (
                  <Typography color="text.secondary">
                    No consumption history
                  </Typography>
                )}
              </Box>
            )}
          </DialogContent>
          <DialogActions>
            <Button onClick={closeView}>Close</Button>
          </DialogActions>
        </Dialog>
      </Box>
    </Box>
  );
}

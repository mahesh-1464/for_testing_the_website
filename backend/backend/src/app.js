require("dotenv").config();

const express = require("express");
const cors = require("cors");
const pool = require("./config/db");

const app = express(); // ✅ FIRST create app

// ✅ Middleware FIRST
app.use(cors({
  origin: "http://localhost:3000",
  credentials: true
}));

app.use(express.json());

const tasksRoutes = require("./tasks/tasks.routes");
const payrollRoutes = require("./payroll/payroll.routes");
const paymentsRoutes = require("./payment/payments.routes");
const purgeRoutes = require("./purging/purging.routes");
const reportRoutes = require("./reports/reports.routes"); 
const workersRoutes = require("./workers/workers.routes");
const locationRoutes = require("./locations/location.routes");  
const suggestionRoutes = require("./suggestions/suggestions.routes");
const authRoutes = require("./auth/auth.routes");
const issuesRoutes = require("./issues/issues.routes");
const paymentManagementRoutes = require("./payment/paymentmanagement.routes");
const presenceRoutes = require("./presence/presence.routes");



app.use("/api/users", require("./users/users.routes"));
app.use("/api/auth", authRoutes);
app.use("/api/inventory", require("./inventory/inventory.routes"));
app.use("/api/workers", require("./workers/workers.routes"));
app.use("/api/attendance", require("./attendance/attendance.routes"));

app.use("/api/tasks", tasksRoutes);
app.use("/api/payroll", payrollRoutes);
app.use("/api/payments", paymentsRoutes);
app.use("/api/purging", require("./purging/purging.routes"));
app.use("/api/joining", require("./joining/joining.routes")); 
app.use("/api/alerts", require("./alerts/alerts.routes"));
app.use("/api/worker-pipeline", require("./worker-pipeline/workerPipeline.routes"));
app.use ("/api/feedback", require("./feedback/feedback.routes")); 
app.use("/api/notifications", require("./notifications/notifications.routes"));
app.use ("/api/reports", reportRoutes);

app.use("/api/workers", workersRoutes);
app.use('/api/worker-location', require('./worker-location/workerLocation.routes'));
// app.use("/api/suggestions", suggestionRoutes);
app.use("/uploads", express.static("uploads"));
app.use("/api/issues", issuesRoutes);
app.use("/api/payment-management", paymentManagementRoutes);
app.use("/api/presence", presenceRoutes);
// ✅ ONLY ONE LOCATION ROUTE
app.use("/api/location", locationRoutes);
// ✅ Test route
app.get("/", (req, res) => {
  res.send("Backend API Running");
});

// Test database connection
pool.query("SELECT 1")
  .then(() => console.log("Database connected successfully"))
  .catch((err) => console.error("Database connection error:", err.message));


module.exports = app;

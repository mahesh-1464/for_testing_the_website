const reportsModel = require("./reports.model");

exports.getSummary = async (req, res) => {
  try {
    const taskResult = await reportsModel.getTaskSummary();
    const revenueResult = await reportsModel.getRevenueSummary();
    const attendanceResult = await reportsModel.getAttendanceSummary();

    res.json({
      tasksCompleted: Number(taskResult.completed),
      pendingTasks: Number(taskResult.pending),
      totalOrders: Number(revenueResult.orders),
      totalRevenue: Number(revenueResult.revenue),
      attendanceRate: Number(attendanceResult.attendance_rate),
    });
  } catch (err) {
    console.error("REPORT SUMMARY ERROR FULL:", err);
    res.status(500).json({ message: "Failed to load summary" });
  }
};

exports.getTaskCompletionByColo = async (req, res) => {
  try {
    const data = await reportsModel.getTaskCompletionByColo();
    res.json(data);
  } catch (err) {
    console.error("TASK BY COLO ERROR:", err);
    res.status(500).json({ message: "Failed to load task data" });
  }
};

exports.getMonthlyRevenueTrend = async (req, res) => {
  try {
    const data = await reportsModel.getMonthlyRevenueTrend();
    res.json(data);
  } catch (err) {
    console.error("MONTHLY REVENUE ERROR:", err);
    res.status(500).json({ message: "Failed to load revenue trend" });
  }
};

exports.getAttendanceTrend = async (req, res) => {
  try {
    const data = await reportsModel.getAttendanceTrend();
    res.json(data);
  } catch (err) {
    console.error("ATTENDANCE TREND ERROR:", err);
    res.status(500).json({ message: "Failed to load attendance trend" });
  }
};

exports.getReportPreview = async (req, res) => {
  try {
    const { reportType, from, to } = req.query;

    const data = await reportsModel.getReportPreview({
      reportType,
      fromDate: from,
      toDate: to,
    });

    res.json(data);
  } catch (err) {
    console.error("REPORT PREVIEW ERROR:", err);
    res.status(500).json({ message: "Failed to load report preview" });
  }
};


// exports.exportPdf = async (req, res) => {
//   try {
//     const { reportType, from, to, colo } = req.query;

//     // placeholder response
//     res.json({
//       message: "PDF export triggered",
//       params: { reportType, from, to, colo },
//     });
//   } catch (err) {
//     console.error("PDF EXPORT ERROR:", err);
//     res.status(500).json({ message: "PDF export failed" });
//   }
// };

// exports.exportExcel = async (req, res) => {
//   try {
//     const { reportType, from, to, colo } = req.query;

//     res.json({
//       message: "Excel export triggered",
//       params: { reportType, from, to, colo },
//     });
//   } catch (err) {
//     console.error("EXCEL EXPORT ERROR:", err);
//     res.status(500).json({ message: "Excel export failed" });
//   }
// };

const ExcelJS = require("exceljs");

exports.exportExcel = async (req, res) => {
  try {
    const { reportType, from, to, colo } = req.query;

    // Create workbook
    const workbook = new ExcelJS.Workbook();
    const sheet = workbook.addWorksheet("Report");

    // Header row
    sheet.columns = [
      { header: "ID", key: "id", width: 15 },
      { header: "COLO", key: "colo", width: 20 },
      { header: "Metric", key: "metric", width: 25 },
      { header: "Value", key: "value", width: 15 },
      { header: "Period", key: "period", width: 20 },
    ];

    // Sample data (replace later with real preview query)
    sheet.addRow({
      id: "RPT-001",
      colo: colo,
      metric: reportType,
      value: "Sample",
      period: `${from} to ${to}`,
    });

    // Set response headers
    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      "attachment; filename=report.xlsx"
    );

    // Send file
    await workbook.xlsx.write(res);
    res.end();
  } catch (err) {
    console.error("EXCEL EXPORT ERROR:", err);
    res.status(500).json({ message: "Excel export failed" });
  }
};

// const ExcelJS = require("exceljs");

exports.exportExcel = async (req, res) => {
  try {
    const { reportType, from, to, colo } = req.query;

    // fetch real preview data
    const rows = await reportsModel.getReportPreview({
      reportType,
      fromDate: from,
      toDate: to,
    });

    const workbook = new ExcelJS.Workbook();
    const sheet = workbook.addWorksheet("Report");

    sheet.columns = [
      { header: "ID", key: "id", width: 15 },
      { header: "COLO", key: "colo", width: 20 },
      { header: "Metric", key: "metric", width: 25 },
      { header: "Value", key: "value", width: 15 },
      { header: "Period", key: "period", width: 20 },
    ];

    rows.forEach((row) => sheet.addRow(row));

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      `attachment; filename=report_${reportType}.xlsx`
    );

    await workbook.xlsx.write(res);
    res.end();
  } catch (err) {
    console.error("EXCEL EXPORT ERROR:", err);
    res.status(500).json({ message: "Excel export failed" });
  }
};
const PDFDocument = require("pdfkit");

exports.exportPdf = async (req, res) => {
  try {
    const { reportType, from, to } = req.query;

    const rows = await reportsModel.getReportPreview({
      reportType,
      fromDate: from,
      toDate: to,
    });

    const doc = new PDFDocument({ margin: 30 });

    res.setHeader("Content-Type", "application/pdf");
    res.setHeader(
      "Content-Disposition",
      `attachment; filename=report_${reportType}.pdf`
    );

    doc.pipe(res);

    doc.fontSize(16).text(`Report: ${reportType}`, { align: "center" });
    doc.moveDown();

    rows.forEach((row) => {
      doc
        .fontSize(10)
        .text(
          `${row.id} | ${row.colo} | ${row.metric} | ${row.value} | ${row.period}`
        );
    });

    doc.end();
  } catch (err) {
    console.error("PDF EXPORT ERROR:", err);
    res.status(500).json({ message: "PDF export failed" });
  }
};
// exports.getWorkerSummary = async (req, res) => {
//   try {
//     const workerId = req.user.id;

//     res.json({
//       summary: {
//         tasksCompleted: 10,
//         avgHours: "08:15",
//         attendance: "90%",
//       },
//       taskTrend: [],
//       attendance: [],
//       worker: {
//         name: "Demo User",
//         role: "Worker",
//         colo: "COLO A",
//       },
//     });
//   } catch (err) {
//     res.status(500).json({ message: "Error" });
//   }
// };

// const getWorkerReport = async (req, res) => {
//   try {
//     const workerId = req.params.workerId;

//     const tasks = await Task.find({ worker: workerId });
//     const attendanceData = await Attendance.find({ worker: workerId });

//     // same calculations from admin
//     // (DO NOT change logic, just use filtered data)

//     res.json({
//       summary,
//       taskTrend,
//       attendance,
//     });

//   } catch (err) {
//     res.status(500).json({ message: "Error" });
//   }
// };

exports.getWorkerSummary = async (req, res) => {
  try {
    const workerId = req.user.id;

    const taskResult =
      await reportsModel.getWorkerTaskSummary(workerId);

    const attendanceResult =
      await reportsModel.getWorkerAttendanceSummary(workerId);

    const trend =
      await reportsModel.getWorkerTrend(workerId);

    const attendance =
      await reportsModel.getWorkerAttendance(workerId);

    console.log({
      summary: {
        tasksCompleted: Number(taskResult.completed || 0),
        pendingTasks: Number(taskResult.pending || 0),
        attendanceRate: Number(attendanceResult.attendance_rate || 0),
      },

      trend,

      attendance,
    });

    res.json({
      summary: {
        tasksCompleted: Number(taskResult.completed || 0),
        pendingTasks: Number(taskResult.pending || 0),
        attendanceRate: Number(attendanceResult.attendance_rate || 0),
      },

      trend: trend || [],

      attendance: attendance || [],
    });

  } catch (err) {
    console.error("WORKER REPORT ERROR:", err);

    res.status(500).json({
      message: "Failed to load worker report",
    });
  }
};
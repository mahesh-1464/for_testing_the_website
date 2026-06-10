export const getWorkerReport = async (req, res) => {
  try {
    const workerId = req.params.workerId;

    // ✅ Only this worker's tasks
    const tasks = await Task.find({ worker: workerId });

    const completedTasks = tasks.filter(
      (t) => t.status === "Completed"
    ).length;

    // ✅ Only this worker's attendance
    const attendanceData = await Attendance.find({
      worker: workerId,
    });

    // Attendance %
    const totalDays = attendanceData.length;
    const presentDays = attendanceData.filter(
      (a) => a.status === "Present"
    ).length;

    const attendancePercent =
      totalDays > 0
        ? Math.round((presentDays / totalDays) * 100) + "%"
        : "0%";

    // Avg Hours
    let totalMinutes = 0;

    attendanceData.forEach((a) => {
      const [h, m] = a.hours.split(":");
      totalMinutes += +h * 60 + +m;
    });

    const avgMinutes =
      totalDays > 0 ? Math.floor(totalMinutes / totalDays) : 0;

    const avgHours = `${String(Math.floor(avgMinutes / 60)).padStart(
      2,
      "0"
    )}:${String(avgMinutes % 60).padStart(2, "0")}`;

    // Task Trend
    const trendMap = {};

    tasks.forEach((task) => {
      const day = new Date(task.updatedAt).toLocaleDateString("en-US", {
        weekday: "short",
      });

      if (!trendMap[day]) trendMap[day] = 0;
      if (task.status === "Completed") trendMap[day]++;
    });

    const taskTrend = Object.keys(trendMap).map((day) => ({
      day,
      completed: trendMap[day],
    }));

    // Format Attendance
    const attendance = attendanceData.map((a) => ({
      id: a._id,
      date: a.date,
      status: a.status,
      hours: a.hours,
    }));

    res.json({
      summary: {
        tasksCompleted: completedTasks,
        avgHours,
        attendance: attendancePercent,
      },
      taskTrend,
      attendance,
    });
  } catch (err) {
    res.status(500).json({ message: "Error fetching report" });
  }
};
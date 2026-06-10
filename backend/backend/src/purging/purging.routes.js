const express = require("express");
const router = express.Router();
const db = require("../config/db");
const authenticateToken = require("../middleware/auth.middleware");


/**
 * GET PURGING SUMMARY
 * GET /api/purging/summary
 */
router.get("/summary", async (req, res) => {
  try {
    const totalPolicies = await db.query(
      "SELECT COUNT(*) FROM purge_policies"
    );

    const lastPurgeLogs = await db.query(
      "SELECT COUNT(*) FROM purge_logs"
    );

    const modulesCovered = await db.query(
      "SELECT COUNT(DISTINCT module) FROM purge_policies"
    );

    console.log("Policies:", totalPolicies.rows);
    console.log("Logs:", lastPurgeLogs.rows);
    console.log("Modules:", modulesCovered.rows);

    res.status(200).json({
      totalPolicies: Number(totalPolicies.rows[0].count),
      lastPurgeLogs: Number(lastPurgeLogs.rows[0].count),
      modulesCovered: Number(modulesCovered.rows[0].count),
    });
  } catch (error) {
        console.error("PURGING SUMMARY ERROR:", error);
    res.status(500).json({ message: "Failed to fetch purging summary" });
  }
});


/**
 * GET ALL PURGE POLICIES
 * GET /api/purging/policies
 */
router.get("/policies", async (req, res) => {
  console.log("POLICIES API HIT");

  try {
    const result = await db.query(`
      SELECT *
      FROM purge_policies
      ORDER BY policy_id
    `);

    console.log("ROWS:", result.rows);

    res.status(200).json(result.rows);
  } catch (error) {
    console.error(error);
  }
});
/**
 * GET PURGE LOGS
 * GET /api/purging/logs
 */
router.get("/logs", async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        log_id,
        policy_id,
        action,
        records_affected,
        run_date,
        status
      FROM purge_logs
      ORDER BY run_date DESC
      LIMIT 20
    `);

    res.status(200).json(result.rows);
  } catch (error) {
    console.error("FETCH LOGS ERROR:", error);
    res.status(500).json({ message: "Failed to fetch purge logs" });
  }
});

/**
 * RUN PURGE NOW
 * POST /api/purging/run
 */
router.post("/run", async (req, res) => {
  const { policy_id } = req.body;

  if (!policy_id) {
    return res.status(400).json({ message: "Policy ID is required" });
  }

  try {
    // Fetch policy
    const policyResult = await db.query(
      "SELECT * FROM purge_policies WHERE policy_id = $1",
      [policy_id]
    );

    if (policyResult.rows.length === 0) {
      return res.status(404).json({ message: "Policy not found" });
    }

    const policy = policyResult.rows[0];

    // DEMO: calculate fake affected records
    const recordsAffected = Math.floor(Math.random() * 3000) + 500;

    // Insert purge log
    await db.query(
      `
      INSERT INTO purge_logs
      (log_id, policy_id, action, records_affected, run_date, status)
      VALUES
      ($1, $2, $3, $4, CURRENT_DATE, 'Success')
      `,
      [
        `LOG-${Date.now()}`,
        policy.policy_id,
        policy.action,
        recordsAffected,
      ]
    );

    res.status(200).json({
      message: "Purge executed successfully",
      recordsAffected,
    });
  } catch (error) {
    console.error("RUN PURGE ERROR:", error);
    res.status(500).json({ message: "Failed to run purge" });
  }
});

router.post("/policies", async (req, res) => {
  const {
    policy_id,
    policy_name,
    module,
    duration_years,
    action,
    schedule,
    status
  } = req.body;

  try {
    await db.query(
      `
      INSERT INTO purge_policies
      (policy_id, policy_name, module, duration_years, action, schedule, status)
      VALUES ($1, $2, $3, $4, $5, $6, $7)
      `,
      [policy_id, policy_name, module, duration_years, action, schedule, status]
    );

    res.status(201).json({ message: "Policy created successfully" });
  } catch (error) {
    console.error("CREATE POLICY ERROR", error);
    res.status(500).json({ message: "Failed to create policy" });
  }
});

router.put("/policies/:id", async (req, res) => {
  const { id } = req.params;
  const {
    policy_name,
    module,
    duration_years,
    action,
    schedule,
    status
  } = req.body;

  try {
    await db.query(
      `
      UPDATE purge_policies
      SET
        policy_name = $1,
        module = $2,
        duration_years = $3,
        action = $4,
        schedule = $5,
        status = $6
      WHERE policy_id = $7
      `,
      [policy_name, module, duration_years, action, schedule, status, id]
    );

    
    res.json({ message: "Policy updated successfully" });
  } catch (error) {
    console.error("UPDATE POLICY ERROR", error);
    res.status(500).json({ message: "Failed to update policy" });
  }
});


module.exports = router;


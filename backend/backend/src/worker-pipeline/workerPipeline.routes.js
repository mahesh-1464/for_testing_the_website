const express = require("express");
const router = express.Router();
const db = require("../config/db");
const authenticateToken = require("../middleware/auth.middleware");

const SLA_CONFIG = require("../config/pipelineSla.config");


/* ======================================================
   GET ALL WORKER APPLICATIONS (WITH SLA)
   GET /api/worker-pipeline
====================================================== */
router.get("/", async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        application_id,
        name,
        role,
        experience_years,
        preferred_vendor,
        preferred_colo,
        phone,
        stage,
        created_at,
        stage_updated_at,
        sla_alert_sent
      FROM worker_applications
      ORDER BY created_at DESC
    `);

    const withSla = result.rows.map(row => {
      const hoursInStage = row.stage_updated_at
        ? Math.floor(
            (Date.now() - new Date(row.stage_updated_at)) / (1000 * 60 * 60)
          )
        : 0;

      const slaLimit = SLA_CONFIG[row.stage] || null;

      return {
        ...row,
        hours_in_stage: hoursInStage,
        sla_breached: slaLimit ? hoursInStage > slaLimit : false
      };
    });

    res.json(withSla);
  } catch (error) {
    console.error("WORKER PIPELINE FETCH ERROR:", error);
    res.status(500).json({ message: "Failed to fetch worker pipeline" });
  }
});

/* ======================================================
   UPDATE PIPELINE STAGE
   PUT /api/worker-pipeline/:applicationId/stage
====================================================== */
router.put("/:applicationId/stage", async (req, res) => {
  const { applicationId } = req.params;
  const { stage } = req.body;

  try {
    // Fetch previous stage
    const previous = await db.query(
      "SELECT stage FROM worker_applications WHERE application_id = $1",
      [applicationId]
    );

    if (previous.rowCount === 0) {
      return res.status(404).json({ message: "Application not found" });
    }

    const oldStage = previous.rows[0].stage;

    // Update stage + timestamp
    const result = await db.query(
      `
      UPDATE worker_applications
      SET stage = $1,
          stage_updated_at = NOW()
      WHERE application_id = $2
      RETURNING *
      `,
      [stage, applicationId]
    );

    const application = result.rows[0];

    // Audit log
    await logPipelineAudit({
      application_id: applicationId,
      old_stage: oldStage,
      new_stage: stage,
      changed_by: req.user?.role || "System"
    });

    // Notification to Admin
    await createNotification({
      title: "Worker Pipeline Update",
      message: `Application ${applicationId} moved from ${oldStage} to ${stage}`,
      recipient_role: "Admin",
      redirect_url: `/worker-pipeline?app=${applicationId}`
    });

    // Auto-create Joining when Onboarded
    if (stage === "Onboarded") {
      await createJoiningFormalities(application);

      await createNotification({
        title: "Worker Onboarded",
        message: `Worker ${application.name} onboarded successfully`,
        recipient_role: "Supervisor",
        redirect_url: `/joining?worker=${applicationId}`
      });
    }

    res.json({
      message: "Stage updated successfully",
      application
    });
  } catch (error) {
    console.error("PIPELINE STAGE UPDATE ERROR:", error);
    res.status(500).json({ message: "Failed to update stage" });
  }
});

/* ======================================================
   CREATE JOINING FORMALITIES
====================================================== */
const createJoiningFormalities = async (application) => {
  const exists = await db.query(
    "SELECT 1 FROM joining_formalities WHERE joining_id = $1",
    [application.application_id]
  );

  if (exists.rowCount > 0) return;

  await db.query(
    `
    INSERT INTO joining_formalities
    (joining_id, name, role, vendor, status, join_date)
    VALUES ($1, $2, $3, $4, 'In Progress', CURRENT_DATE)
    `,
    [
      application.application_id,
      application.name,
      application.role,
      application.preferred_vendor
    ]
  );

  await db.query(
    `
    INSERT INTO joining_documents
    (joining_id, aadhaar, pan, medical, police, contract)
    VALUES ($1, 'Pending', 'Pending', 'Pending', 'Pending', 'Pending')
    `,
    [application.application_id]
  );

  await db.query(
    `
    INSERT INTO joining_training
    (joining_id, safety, colo_rules, fire, hygiene)
    VALUES ($1, false, false, false, false)
    `,
    [application.application_id]
  );

  await db.query(
    `
    INSERT INTO joining_access
    (joining_id, id_card, access_card, app_login)
    VALUES ($1, false, false, false)
    `,
    [application.application_id]
  );
};

/* ======================================================
   PIPELINE AUDIT LOG
====================================================== */
const logPipelineAudit = async ({
  application_id,
  old_stage,
  new_stage,
  changed_by
}) => {
  await db.query(
    `
    INSERT INTO worker_pipeline_audit
    (application_id, old_stage, new_stage, changed_by)
    VALUES ($1, $2, $3, $4)
    `,
    [application_id, old_stage, new_stage, changed_by]
  );
};

/* ======================================================
   GET PIPELINE AUDIT LOGS
   GET /api/worker-pipeline/:applicationId/audit
====================================================== */
router.get("/:applicationId/audit", async (req, res) => {
  const { applicationId } = req.params;

  try {
    const result = await db.query(
      `
      SELECT
        old_stage,
        new_stage,
        changed_by,
        changed_at
      FROM worker_pipeline_audit
      WHERE application_id = $1
      ORDER BY changed_at DESC
      `,
      [applicationId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error("PIPELINE AUDIT FETCH ERROR:", error);
    res.status(500).json({ message: "Failed to fetch audit logs" });
  }
});

/* ======================================================
   CREATE NOTIFICATION (UTILITY)
====================================================== */
const createNotification = async ({
  title,
  message,
  recipient_role,
  redirect_url
}) => {
  await db.query(
    `
    INSERT INTO notifications
    (title, message, recipient_role, redirect_url)
    VALUES ($1, $2, $3, $4)
    `,
    [title, message, recipient_role, redirect_url]
  );
};

module.exports = router;

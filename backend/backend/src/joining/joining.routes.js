const express = require("express");
const router = express.Router();
const db = require("../config/db");
const authenticateToken = require("../middleware/auth.middleware");
const authorizeRoles = require("../middleware/role.middleware");

const ensureNotCompleted = async (joiningId) => {
  const result = await db.query(
    "SELECT status FROM joining_formalities WHERE joining_id = $1",
    [joiningId]
  );

  return result.rows[0]?.status !== "Completed";
};




/**
 * GET ALL JOINING FORMALITIES
 */
router.get("/", async (req, res) => {
  try {
    const result = await db.query(`
      SELECT
        jf.joining_id,
        jf.name,
        jf.role,
        jf.vendor,
        jf.status,
        jf.join_date,
        jd.aadhaar,
        jd.pan,
        jd.medical,
        jd.police,
        jd.contract,
        jt.safety,
        jt.colo_rules,
        jt.fire,
        jt.hygiene,
        ja.id_card,
        ja.access_card,
        ja.app_login
      FROM joining_formalities jf
      LEFT JOIN joining_documents jd ON jf.joining_id = jd.joining_id
      LEFT JOIN joining_training jt ON jf.joining_id = jt.joining_id
      LEFT JOIN joining_access ja ON jf.joining_id = ja.joining_id
      ORDER BY jf.join_date DESC
    `);

    const formatted = result.rows.map(row => {
      const progress = calculateProgress(row);
      return {
        ...row,
        progress,
        status: progress === 100 ? "Completed" : "In Progress"
      };
    });

    res.json(formatted);
  } catch (error) {
    console.error("JOINING FETCH ERROR:", error);
    res.status(500).json({ message: "Failed to fetch joining data" });
  }
});

/**
 * APPROVE WORKER (ADMIN ONLY)
 */
router.put(
  "/approve/:joiningId",
  authenticateToken,
  authorizeRoles(["Admin"]),
  async (req, res) => {
    try {
      await db.query(
        `UPDATE joining_formalities SET status = 'Completed' WHERE joining_id = $1`,
        [req.params.joiningId]
      );
      await createNotification({
  title: "Worker Approved",
  message: `Worker ${req.params.joiningId} approved and activated`,
  recipient_role: "Supervisor",
  joining_id: req.params.joiningId
});

      res.json({ message: "Worker approved successfully" });
    } catch (error) {
      console.error("APPROVE ERROR:", error);
      res.status(500).json({ message: "Approval failed" });
    }
  }
);

const calculateProgress = (row) => {
  let score = 0;

  const docs = [row.aadhaar, row.pan, row.medical, row.police, row.contract];
  score += (docs.filter(d => d === "Submitted").length / 5) * 40;

  const training = [row.safety, row.colo_rules, row.fire, row.hygiene];
  score += (training.filter(t => t === true).length / 4) * 40;

  const access = [row.id_card, row.access_card, row.app_login];
  score += (access.filter(a => a === true).length / 3) * 20;

  return Math.round(score);
};


/**
 * UPDATE DOCUMENT STATUS
 * PATCH /api/joining/document
 */
router.patch(
  "/document",
  authenticateToken,
  async (req, res) => {
    const { joining_id, document, value } = req.body;

    const allowedDocs = ["aadhaar", "pan", "medical", "police", "contract"];
    if (!allowedDocs.includes(document)) {
      return res.status(400).json({ message: "Invalid document type" });
    }

    // 🔒 Block updates after approval
    if (!(await ensureNotCompleted(joining_id))) {
      return res.status(403).json({ message: "Worker already approved" });
    }

    try {
      // 1️⃣ Fetch old value
      const oldRes = await db.query(
        `SELECT ${document} FROM joining_documents WHERE joining_id = $1`,
        [joining_id]
      );
      const oldValue = oldRes.rows[0]?.[document];

      // 2️⃣ Update document
      await db.query(
        `
        UPDATE joining_documents
        SET ${document} = $1
        WHERE joining_id = $2
        `,
        [value, joining_id]
      );

      // 3️⃣ Audit log
      await logJoiningAudit({
        joining_id,
        action_type: "DOCUMENT_UPDATE",
        field_name: document,
        old_value: oldValue,
        new_value: value,
        performed_by: req.user?.emp_id || "SYSTEM"
      });
// 4️⃣ Notification
      await createNotification({
  title: "Document Updated",
  message: `${document.toUpperCase()} updated for worker ${joining_id}`,
  recipient_role: "Admin",
  joining_id
});


      res.json({ message: "Document updated successfully" });
    } catch (error) {
      console.error("DOCUMENT UPDATE ERROR:", error);
      res.status(500).json({ message: "Failed to update document" });
    }
  }
);


/**
 * UPDATE TRAINING STATUS
 * PATCH /api/joining/training
 */
router.patch(
  "/training",
  authenticateToken,
  async (req, res) => {
    const { joining_id, training, value } = req.body;

    const allowedTraining = ["safety", "colo_rules", "fire", "hygiene"];
    if (!allowedTraining.includes(training)) {
      return res.status(400).json({ message: "Invalid training type" });
    }

    if (!(await ensureNotCompleted(joining_id))) {
      return res.status(403).json({ message: "Worker already approved" });
    }

    try {
      const oldRes = await db.query(
        `SELECT ${training} FROM joining_training WHERE joining_id = $1`,
        [joining_id]
      );
      const oldValue = oldRes.rows[0]?.[training];

      await db.query(
        `
        UPDATE joining_training
        SET ${training} = $1
        WHERE joining_id = $2
        `,
        [value, joining_id]
      );

      await logJoiningAudit({
        joining_id,
        action_type: "TRAINING_UPDATE",
        field_name: training,
        old_value: oldValue,
        new_value: value,
        performed_by: req.user?.emp_id || "SYSTEM"
      });
      // Notification
      await createNotification({
  title: "Training Updated",
  message: `${training.toUpperCase()} training updated for worker ${joining_id}`,
  recipient_role: "Admin",
  joining_id
});


      res.json({ message: "Training updated successfully" });
    } catch (error) {
      console.error("TRAINING UPDATE ERROR:", error);
      res.status(500).json({ message: "Failed to update training" });
    }
  }
);


/**
 * UPDATE ACCESS PROVISIONING
 * PATCH /api/joining/access
 */
router.patch(
  "/access",
  authenticateToken,
  async (req, res) => {
    const { joining_id, access, value } = req.body;

    const allowedAccess = ["id_card", "access_card", "app_login"];
    if (!allowedAccess.includes(access)) {
      return res.status(400).json({ message: "Invalid access type" });
    }

    if (!(await ensureNotCompleted(joining_id))) {
      return res.status(403).json({ message: "Worker already approved" });
    }

    try {
      const oldRes = await db.query(
        `SELECT ${access} FROM joining_access WHERE joining_id = $1`,
        [joining_id]
      );
      const oldValue = oldRes.rows[0]?.[access];

      await db.query(
        `
        UPDATE joining_access
        SET ${access} = $1
        WHERE joining_id = $2
        `,
        [value, joining_id]
      );

      await logJoiningAudit({
        joining_id,
        action_type: "ACCESS_UPDATE",
        field_name: access,
        old_value: oldValue,
        new_value: value,
        performed_by: req.user?.emp_id || "SYSTEM"
      });

      // Notification
      await createNotification({
  title: "Access Provisioned",
  message: `${access.toUpperCase()} access updated for worker ${joining_id}`,
  recipient_role: "Admin",
  joining_id
});


      res.json({ message: "Access updated successfully" });
    } catch (error) {
      console.error("ACCESS UPDATE ERROR:", error);
      res.status(500).json({ message: "Failed to update access" });
    }
  }
);


const logJoiningAudit = async ({
  joining_id,
  action_type,
  field_name,
  old_value,
  new_value,
  performed_by
}) => {
  await db.query(
    `
    INSERT INTO joining_audit_logs
    (joining_id, action_type, field_name, old_value, new_value, performed_by)
    VALUES ($1, $2, $3, $4, $5, $6)
    `,
    [joining_id, action_type, field_name, old_value, new_value, performed_by]
  );
};

const createNotification = async ({
  title,
  message,
  recipient_role,
  joining_id
}) => {

  await db.query(
    `
    INSERT INTO notifications
    (title, message, recipient_role, joining_id)
    VALUES ($1, $2, $3, $4)
    `,
    [title, message, recipient_role, joining_id]
  );

};
/**
 * GET AUDIT LOGS FOR A WORKER
 * GET /api/joining/audit/:joiningId
 */
router.get(
  "/audit/:joiningId",
  authenticateToken,
  async (req, res) => {
    const { joiningId } = req.params;

    try {
      const result = await db.query(
        `
        SELECT
          action_type,
          field_name,
          old_value,
          new_value,
          performed_by,
          performed_at
        FROM joining_audit_logs
        WHERE joining_id = $1
        ORDER BY performed_at DESC
        `,
        [joiningId]
      );

      res.json(result.rows);
    } catch (error) {
      console.error("FETCH AUDIT LOG ERROR:", error);
      res.status(500).json({ message: "Failed to fetch audit logs" });
    }
  }
);

module.exports = router;

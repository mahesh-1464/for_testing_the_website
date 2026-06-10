const db = require("../config/db");
const { GEOFENCE_RADIUS_METERS } = require("../config/gps.config");
const { getDistanceInMeters } = require("../utils/gps.utils");

/**
 * LIST VIEW
 */
exports.getAllLocations = async (locationId) => {
  const { rows } = await db.query(`
    SELECT
      id,
      data_center AS "dataCenter",
      colo,
      hall,
      zone,
      status,
      latitude AS lat,
      longitude AS lng
     FROM location_details
    ORDER BY id
  `);

  return rows;
};

/**
 * DETAIL VIEW
 */
exports.fetchLocationDetail = async (locationId) => {
  // 1️⃣ Location core
  const locationRes = await db.query(
    `
    SELECT
      id,
      data_center AS "dataCenter",
      colo,
      hall,
      zone,
      rack_start AS "rackStart",
      rack_end AS "rackEnd",
      status,
      latitude AS lat,
      longitude AS lng
    FROM location_details
    WHERE id = $1
    `,
    [locationId]
  );

  if (!locationRes.rows.length) return null;
  const location = locationRes.rows[0];

  // 2️⃣ Racks
  const racksRes = await db.query(
    `
    SELECT
      rack_number AS "rackNumber",
      status,
      client,
      task_count AS "taskCount"
    FROM location_racks
    WHERE location_detail_id = $1
    ORDER BY rack_number
    `,
    [locationId]
  );

  // 3️⃣ Tasks
  const tasksRes = await db.query(
    `
    SELECT
      id,
      title,
      status,
      priority,
      assigned_to AS "assignedTo",
      gps_valid AS "gpsValid",
      rack_number AS rack
    FROM location_tasks
    WHERE location_detail_id = $1
    `,
    [locationId]
  );

  // 4️⃣ Inventory
  const invRes = await db.query(
    `
    SELECT
      item,
      quantity_required AS qty,
      available,
      pending_return
    FROM location_inventory
    WHERE location_detail_id = $1
    `,
    [locationId]
  );

  const inventory = {
    required: invRes.rows.map(r => ({
      item: r.item,
      qty: r.qty
    })),
    available: invRes.rows.every(r => r.available === true),
    pendingReturn: invRes.rows.some(r => r.pending_return === true)
  };

  // 5️⃣ Client history
  const historyRes = await db.query(
    `
    SELECT
      client,
      from_location AS "from",
      to_location AS "to",
      moved_at AS date
    FROM location_client_history
    WHERE location_detail_id = $1
    ORDER BY moved_at DESC
    `,
    [locationId]
  );

  return {
    ...location,
    racks: racksRes.rows,
    tasks: tasksRes.rows,
    taskCount: tasksRes.rows.length,
    inventory,
    clientHistory: historyRes.rows
  };
};

/**
 * UPDATE LOCATION + TRIGGER GPS VALIDATION
 */
exports.updateLocation = async (locationId, payload) => {
  const { status, latitude, longitude } = payload;

  const { rows } = await db.query(
    `
    UPDATE location_details
    SET
      status = COALESCE($1, status),
      latitude = COALESCE($2, latitude),
      longitude = COALESCE($3, longitude)
    WHERE id = $4
    RETURNING *
    `,
    [status, latitude, longitude, locationId]
  );

  if (!rows.length) return null;

  // 🔥 Trigger GPS validation
  await exports.validateTaskGpsForLocation(locationId);

  return rows[0];
};

/**
 * VALIDATE TASK GPS AGAINST LOCATION
 */
exports.validateTaskGpsForLocation = async (locationId) => {
  // 1️⃣ Fetch location coordinates
  const locRes = await db.query(
    `
    SELECT
      latitude::float AS lat,
      longitude::float AS lng
    FROM location_details
    WHERE id = $1
    `,
    [locationId]
  );

  if (!locRes.rows.length) return;

  const { lat, lng } = locRes.rows[0];

  // 2️⃣ Fetch tasks with GPS coordinates
  const tasksRes = await db.query(
    `
    SELECT
      id,
      task_latitude::float AS lat,
      task_longitude::float AS lng
    FROM location_tasks
    WHERE location_detail_id = $1
    `,
    [locationId]
  );

  // 3️⃣ Validate each task
  for (const task of tasksRes.rows) {
  if (!task.lat || !task.lng) continue;

  const distance = getDistanceInMeters(
    lat,
    lng,
    task.lat,
    task.lng
  );

/**
 * UPDATE WORKER LIVE LOCATION (NEW)
 */




exports.getWorkerLocation = async (workerId) => {
  const { rows } = await db.query(`
    SELECT worker_id, latitude AS lat, longitude AS lng, updated_at
    FROM worker_live_location
    WHERE worker_id = $1
  `, [workerId]);

  return rows[0];
};
/**
 * GET WORKER LIVE LOCATION
 */
exports.getWorkerLocation = async (workerId) => {
  const { rows } = await db.query(
    `
    SELECT
      worker_id,
      latitude AS lat,
      longitude AS lng,
      updated_at
    FROM worker_locations
    WHERE worker_id = $1
    ORDER BY updated_at DESC
    LIMIT 1
    `,
    [workerId]
  );

  return rows[0];
};

  const isValid = distance <= GEOFENCE_RADIUS_METERS;

  // Update GPS status
  await db.query(
    `
    UPDATE location_tasks
    SET gps_valid = $1
    WHERE id = $2
    `,
    [isValid, task.id]
  );

  // 🚨 If invalid → create notification
  if (!isValid) {
    // Prevent duplicate alerts for same task
    const existing = await db.query(
      `
      SELECT 1
      FROM notifications
      WHERE title = 'GPS Violation'
        AND message LIKE $1
        AND is_read = false
      LIMIT 1
      `,
      [`%Task ${task.id}%`]
    );

    if (!existing.rows.length) {
      await db.query(
        `
        INSERT INTO notifications
        (title, message, recipient_role, is_read, created_at)
        VALUES ($1, $2, $3, false, NOW())
        `,
        [
          "GPS Violation",
          `Task ${task.id} is outside allowed geo-fence radius.`,
          "Admin"
        ]
      );
    }
  }
  }
}
exports.updateWorkerLocation = async ({
  workerId,
  latitude,
  longitude,
}) => {

  const existing = await db.query(
    `
    SELECT *
    FROM worker_locations
    WHERE worker_id = $1
    `,
    [workerId]
  );

  let result;

  if (existing.rows.length > 0) {

    result = await db.query(
      `
      UPDATE worker_locations
      SET
        latitude = $1,
        longitude = $2,
        updated_at = NOW()
      WHERE worker_id = $3
      RETURNING *
      `,
      [latitude, longitude, workerId]
    );

  } else {

    result = await db.query(
      `
      INSERT INTO worker_locations
      (worker_id, latitude, longitude)
      VALUES ($1, $2, $3)
      RETURNING *
      `,
      [workerId, latitude, longitude]
    );
  }

  return result.rows[0];
};
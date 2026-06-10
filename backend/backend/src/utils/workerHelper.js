export const getWorkerNameByLocation = (locationId, workerLocations, workers) => {
  if (!workerLocations || !workers) return "Unassigned";

  // Find mapping
  const mapping = workerLocations.find(
    (wl) => wl.location_id === locationId
  );

  if (!mapping) return "Unassigned";

  // Find worker details
  const worker = workers.find(
    (w) => w.id === mapping.worker_id
  );

  return worker ? worker.name : "Unknown Worker";
};
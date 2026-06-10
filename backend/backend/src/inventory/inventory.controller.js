const pool = require("../config/db");

const getInventory = async (req, res) => {
  try {
const result = await pool.query(`
  SELECT 
    i.inventory_id,
    i.item_name,
    i.current_stock,
    i.min_stock_level,
    i.category,
    l.hall AS location_name
  FROM inventory i
  LEFT JOIN locations l ON i.location_id = l.id
  ORDER BY i.inventory_id
`);

const data = result.rows.map(item => {
  let status = "OK";

  if (item.current_stock === 0) status = "Out of Stock";
  else if (item.current_stock <= item.min_stock_level) status = "Low Stock";

return {
  id: item.inventory_id,

  // IMPORTANT
  name: item.item_name || "No Item",

  category: item.category || "General",

  // IMPORTANT
  quantity: Number(item.current_stock || 0),

  // IMPORTANT
  minStock: Number(item.min_stock_level || 0),

  colo: item.location_name || "COLO A",

  status,

  // IMPORTANT
  lastUpdated: new Date().toISOString().split("T")[0],

  supervisor: "Not Assigned",
};
});

res.json({
  success: true,
  data
});

  } catch (error) {
    console.error("Error fetching inventory:", error.message);
    res.status(500).json({
      success: false,
      message: "Failed to fetch inventory",
    });
  }
};

const addInventory = async (req, res) => {
  try {
    const { item_name, current_stock, min_stock_level, location_id } = req.body;

    const result = await pool.query(
      `
      INSERT INTO inventory (item_name, current_stock, min_stock_level, location_id)
      VALUES ($1, $2, $3, $4)
      RETURNING *
      `,
      [item_name, current_stock, min_stock_level, location_id]
    );

    res.json({
      success: true,
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Add inventory error:", error.message);
    res.status(500).json({ success: false, message: "Failed to add inventory" });
  }
};

const updateInventory = async (req, res) => {
  try {
    const { id } = req.params;
    const { item_name, current_stock, min_stock_level } = req.body;

    const result = await pool.query(
      `
      UPDATE inventory
      SET item_name=$1, current_stock=$2, min_stock_level=$3
      WHERE inventory_id=$4
      RETURNING *
      `,
      [item_name, current_stock, min_stock_level, id]
    );

    res.json({
      success: true,
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Update inventory error:", error.message);
    res.status(500).json({ success: false, message: "Failed to update inventory" });
  }
};

const issueInventory = async (req, res) => {
  try {
    const { id } = req.params;
    const { issueQty } = req.body;

    const result = await pool.query(
      `
      UPDATE inventory
      SET current_stock = GREATEST(current_stock - $1, 0)
      WHERE inventory_id = $2
      RETURNING *
      `,
      [issueQty, id]
    );

    res.json({
      success: true,
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Issue inventory error:", error.message);
    res.status(500).json({ success: false, message: "Failed to issue inventory" });
  }
};

const consumeInventory = async (req, res) => {

  const { inventoryId, quantity } = req.body;

  try {

    // 1️⃣ Get inventory item
    const itemResult = await pool.query(
      `
      SELECT *
      FROM inventory
      WHERE inventory_id = $1
      `,
      [inventoryId]
    );

    if (itemResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Inventory item not found",
      });
    }

    const item = itemResult.rows[0];

    // 2️⃣ Prevent negative stock
    if (item.current_stock < quantity) {
      return res.status(400).json({
        success: false,
        message: "Not enough stock",
      });
    }

    // 3️⃣ Update stock
    await pool.query(
      `
      UPDATE inventory
      SET current_stock = current_stock - $1
      WHERE inventory_id = $2
      `,
      [quantity, inventoryId]
    );

    // 4️⃣ Insert history
    await pool.query(
      `
      INSERT INTO inventory_history
      (inventory_id, item_name, quantity_used)
      VALUES ($1, $2, $3)
      `,
      [
        inventoryId,
        item.item_name,
        quantity,
      ]
    );

    res.json({
      success: true,
      message: "Inventory consumed successfully",
    });

  } catch (err) {

    console.log(err);

    res.status(500).json({
      success: false,
      message: err.message,
    });
  }
};

const getInventoryHistory = async (req, res) => {

  try {

    const result = await pool.query(
      `
      SELECT *
      FROM inventory_history
      ORDER BY used_at DESC
      `
    );

    res.json({
      success: true,
      data: result.rows,
    });

  } catch (err) {

    console.log(err);

    res.status(500).json({
      success: false,
      message: err.message,
    });
  }
};

module.exports = {
  getInventory,
  addInventory,
  updateInventory, 
  issueInventory,
  consumeInventory,
  getInventoryHistory, 
};
    
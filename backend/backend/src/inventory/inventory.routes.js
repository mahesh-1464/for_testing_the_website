const express = require("express");
const router = express.Router();
const controller = require("./inventory.controller");


const {
  getInventory,
  addInventory,
  updateInventory,
  issueInventory,
  consumeInventory,
  getInventoryHistory,
} = require("./inventory.controller");

router.get("/", getInventory);
router.get("/history", controller.getInventoryHistory);

router.post("/", addInventory);
router.put("/:id", updateInventory);
router.put("/:id/issue", issueInventory);
router.post("/consume", controller.consumeInventory);


module.exports = router;

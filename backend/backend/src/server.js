require("dotenv").config();
require("dotenv").config({ path: __dirname + "/.env" });
console.log("JWT_SECRET FROM SERVER:", process.env.JWT_SECRET);
const app = require("./app");

const PORT = process.env.PORT || 8000;

app.listen(PORT, () => {
  console.log(`Backend running on port ${PORT}`);
});

const locationRoutes = require("./locations/location.routes");

app.use("/api/locations", locationRoutes);
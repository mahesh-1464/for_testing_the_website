
// const { Pool } = require("pg");

// const pool = new Pool({
//   host: "localhost",
//   user: "postgres",
//   password: "root",
//   database: "dc_hms",
//   port: 5432,
//   connectionString: process.env.DATABASE_URL,
// });

// module.exports = pool;
// src/config/db.js
const { Pool } = require("pg");

const pool = process.env.DATABASE_URL
  ? new Pool({ connectionString: process.env.DATABASE_URL, ssl: { rejectUnauthorized: false } })
  : new Pool({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      port: process.env.DB_PORT ? Number(process.env.DB_PORT) : 5432,
    });

pool.query("SELECT 1")
  .then(() => console.log("DB connected"))
  .catch((err) => console.error("DB connection error:", err.message));

module.exports = pool;

const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  password: "kali",
  host: "localhost",
  port: "5432",
  db: "teacherate",
});
module.exports = pool;

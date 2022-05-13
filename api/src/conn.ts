import mysql from "mysql2";

const connection = mysql.createConnection({
  host: "l6glqt8gsx37y4hs.cbetxkdyhwsb.us-east-1.rds.amazonaws.com",
  user: "d6k3cmj0kltg0dae",
  password: "unpf5k0j1anqzppe",
  database: "n8j1ue02jowtl3ry",
});

export default connection
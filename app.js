const express = require("express");
const app = express();
const db = require("./models");
const cors = require("cors");
app.use(cors());

//import routes
const users = require("./routes/users");

//use routes
app.use("/users", users);

db.sequelize.sync().then(() => {
  app.listen(5000, () => {
    console.log(`Server running on port 5000`);
  });
});

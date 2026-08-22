const express = require("express");

const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Enterprise DevOps Platform deployment verified",
    environment: process.env.APP_ENV || "development"
  });
});

app.listen(port, () => {
  console.log(`Application listening on port ${port}`);
});
const express = require('express');
require('dotenv').config();

// const fs = require('fs');
const app = express();
const port = process.env.PORT || 3000;
const dbPassword = process.env.DB_PASSWORD;
const apiKey = process.env.API_KEY;


// Middleware to serve static files
app.use(express.static('public'));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

app.get('/secrets', (req, res) => {
  // const dbPassword = fs.readFileSync('/run/secrets/db_password', 'utf8');
  // const apiKey = fs.readFileSync('/run/secrets/api_key', 'utf8');
  // res.send(`DB_PASSWORD is: ${dbPassword}<br>API_KEY is: ${apiKey}`);

  res.json({
    DB_PASSWORD: dbPassword,
    API_KEY: apiKey,
  });
});

app.get('/env', (req, res) => {
  res.json({
    APP_VERSION: process.env.APP_VERSION,
    BUILD_ENV: process.env.BUILD_ENV,
    NODE_ENV: process.env.NODE_ENV,
    PORT: process.env.PORT
  });
});

app.listen(port, () => {
  console.log(`Server is running on port http://localhost:${port}/`);
  console.log('Environment Variables:');
  console.log(`APP_VERSION: ${process.env.APP_VERSION}`);
  console.log(`BUILD_ENV: ${process.env.BUILD_ENV}`);
  console.log(`NODE_ENV: ${process.env.NODE_ENV}`);
  console.log(`PORT: ${process.env.PORT}`);
});
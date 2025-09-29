const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config(); // Loads .env file content

const app = express();

// --- Middlewares ---
app.use(cors()); // Allows requests from other origins (like your Flutter app)
app.use(express.json()); // Parses incoming JSON requests

// --- Database Connection ---
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log('MongoDB Connected...'))
  .catch(err => console.log(err));

// --- Routes ---
app.get('/', (req, res) => {
  res.send('API is running...');
});
app.use('/api/auth', require('./routes/auth')); // Auth routes

// --- Server Listening ---
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
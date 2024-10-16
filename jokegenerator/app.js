const express = require('express');
const axios = require('axios');
const { Pool } = require('pg');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;

// PostgreSQL connection pool
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Root route to serve index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Route to fetch a random joke in JSON format
app.get('/joke', async (req, res) => {
  try {
    const response = await axios.get('https://official-joke-api.appspot.com/jokes/random');
    const { setup, punchline } = response.data;

    if (!setup || !punchline) {
      throw new Error('Invalid joke format from API');
    }

    // Optionally save the joke to the database
    await pool.query('INSERT INTO jokes (setup, punchline) VALUES ($1, $2)', [setup, punchline]);

    // Respond with the joke in JSON format
    res.json({ setup, punchline });
  } catch (error) {
    console.error('Error fetching joke:', error.message);
    res.status(500).json({ error: 'Failed to generate joke' });
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

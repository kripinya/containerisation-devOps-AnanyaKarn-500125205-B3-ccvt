const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = process.env.PORT || 3000;

// PostgreSQL connection pool
const pool = new Pool({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'db',
  database: process.env.DB_NAME || 'assignment1',
  password: process.env.DB_PASSWORD || 'postgres',
  port: process.env.DB_PORT || 5432,
});

app.use(express.json());

// Basic health check endpoint
app.get('/health', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT NOW() as time');
    client.release();
    res.json({
      status: 'healthy',
      db_time: result.rows[0].time
    });
  } catch (err) {
    console.error('Database connection error:', err);
    res.status(500).json({ status: 'unhealthy', error: err.message });
  }
});

app.get('/', (req, res) => {
    res.json({ message: 'Welcome to the Containerized Web Application API!' });
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Backend API listening on port ${port}`);
});

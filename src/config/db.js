// src/config/db.js

const mysql = require('mysql2/promise');
require('dotenv').config(); // Carga las variables definidas en .env

// Creamos un Pool de Conexiones utilizando mysql2/promise
const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'prueba_api',
  port: process.env.DB_PORT ? Number(process.env.DB_PORT) : 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Función auxiliar para probar si la conexión es exitosa al arrancar
async function testConnection() {
  try {
    const connection = await pool.getConnection();
    console.log(' Conexión exitosa a la base de datos MySQL');
    connection.release(); // Liberamos la conexión de vuelta al pool
  } catch (error) {
    console.error(' Error al conectar con la base de datos:', error.message);
  }
}

// Probamos la conexión al importar el módulo
testConnection();

// Exportamos el pool para usarlo en nuestros servicios / controladores
module.exports = pool;
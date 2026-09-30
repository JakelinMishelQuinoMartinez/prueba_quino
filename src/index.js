// 1. Importamos el módulo nativo http de Node.js
const http = require('http');

// Definimos el puerto en el que escuchará el servidor
const PORT = process.env.PORT || 3000;

// 2. Creamos el servidor HTTP
const server = http.createServer((req, res) => {
  // Capturamos el método (GET, POST, etc.) y la URL solicitada
  const { method, url } = req;

  console.log(`Petición recibida: ${method} ${url}`);

  // Configuramos el encabezado para indicar que responderemos en formato JSON
  res.setHeader('Content-Type', 'application/json');

  // Definimos el código de estado HTTP 200 OK
  res.statusCode = 200;

  // Enviamos la respuesta convertida a cadena JSON
  res.end(JSON.stringify({
    message: '¡Servidor Node.js nativo en funcionamiento!',
    methodReceived: method,
    urlReceived: url
  }));
});

// 3. Ponemos el servidor a escuchar peticiones
server.listen(PORT, () => {
  console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});

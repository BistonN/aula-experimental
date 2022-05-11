const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors({ credentials: true, origin: true }));
app.use(express.json());

const usuarioRoute = require('./routes/usuarios.route');

app.use('/usuarios', usuarioRoute);

module.exports = app;
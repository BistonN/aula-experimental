const express = require('express');
const router = express.Router();
const usuariosController = require('../controllers/usuarios.controller');

router.post(
    '/login',
    usuariosController.getUsuarioByEmail,
    usuariosController.login
);

module.exports = router;
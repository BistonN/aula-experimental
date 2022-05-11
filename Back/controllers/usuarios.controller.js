const mysql = require('../mysql');

exports.getUsuarioByEmail = async (req, res, next) => {
    try {
        const result = await mysql.execute(
            'SELECT id_usuario FROM usuarios WHERE email = ?',
            [req.body.email]
        );
        if (result) {
            res.locals.id_usuario = result[0].id_usuario;
            next();
        } else {
            return res.status(401).send({ menssage: 'E-mail não encontrado' });
        }
    } catch (error) {
        return res.status(500).send({ error: error, menssage: 'Erro ao logar' });
    }
}

exports.login = async (req, res, next) => {
    try {
        const result =  await mysql.execute(
            'SELECT senha, nome FROM usuarios WHERE id_usuario = ?',
            [res.locals.id_usuario]
        );
        if (req.body.senha === result[0].senha) {
            return res.status(201).send({
                message: 'Autenticado com sucesso',
                email: req.body.email,
                id_usuario: req.body.id_usuario,
                nome: result[0].nome,
            });
        } else {
            return res.status(401).send({ menssage: 'Senha Incorreta' });
        } 
    } catch (error) {
        console.log(error);
        return res.status(500).send({ error: error, menssage: 'Erro ao logar' });
    }
}

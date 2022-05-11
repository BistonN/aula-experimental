var mysql = require('mysql');

cred = {
    web_mysql_user: 'root',
    web_mysql_password: 'thor',
    web_mysql_database: 'db_tt',
    web_mysql_host: 'localhost',
    web_mysql_port: 3306
}

const pool = mysql.createPool({
    "user": cred.web_mysql_user,
    "password": cred.web_mysql_password,
    "database": cred.web_mysql_database,
    "host": cred.web_mysql_host,
    "port": cred.web_mysql_port
});

const pool_multi = mysql.createPool({
    "user": cred.web_mysql_user,
    "password": cred.web_mysql_password,
    "database": cred.web_mysql_database,
    "host": cred.web_mysql_host,
    "port": cred.web_mysql_port,
    "multipleStatements": true
});

exports.execute = (query, params = [], var_pool = pool) => {
    return new Promise((resolve, reject) => {
        var_pool.query(query, params, (error, results) => {
            if (error) {
                reject(error);
            } else {
                resolve(results);
            }
        });
    });
}

exports.pool = pool;
exports.pool_multi = pool_multi;
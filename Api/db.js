const mysql = require('mysql');

const infos = {
	host: 'localhost',
	user: 'root',
	password: '',
	port: '3306',
	database: 'zoov'
};
const connection = mysql.createConnection(infos);

connection.connect((error) => {
	if (error) {
		console.error(error);
	} else {
		console.log('Connected..!');
	}
});

module.exports = connection;

var mysql = require('mysql')

var pool = mysql.createPool({
	connectionLimit : 10,
	host 		: 'classmysql.engr.oregonstate.edu',
	user 		: 'cs340_parkjace',
	password	: '6951',
	database  	: 'cs340_parkjace'
})

module.exports.pool = pool;

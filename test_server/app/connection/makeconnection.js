var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : '10.0.2.15',
  user     : 'portale_prenotazioni',
  password : 'portale_prenotazioni',
  database : 'prenotazioni_vaccinazioni'
});

connection.connect((err) => {
  if (err) throw err;
  console.log("MySql Connected");
});


module.exports = connection;


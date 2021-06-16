var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : '127.0.0.1',
  user     : 'portale_prenotazioni',
  password : 'portale_prenotazioni',
  database : 'prenotazioni_vaccinazioni'
});
module.exports = connection;
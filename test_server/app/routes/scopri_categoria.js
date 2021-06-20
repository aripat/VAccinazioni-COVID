var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

/* GET users listing. */

router.get('/poli_vaccinali.html', function(req, res, next) {
  const categoria = req.query.categoria
  connection.query('SELECT * FROM erogazione, polo_per_categoria WHERE erogazione.polo_vaccinale = polo_per_categoria.polo_vaccinale AND categoria=\''+categoria+'\' ORDER BY erogazione.data, erogazione.ora', function (error, results, fields) {
    // error will be an Error if one occurred during the query
    // results will contain the results of the query
    // fields will contain information about the returned results fields (if any)
    res.render('poli_vaccinali', { title: 'Home', results: results });
  });
});

module.exports = router;
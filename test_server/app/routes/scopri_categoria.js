var express = require('express');
var router = express.Router();
var connection = require('../connection/makeconnection.js');

/* GET users listing. */
router.get('/poli_vaccinali.html', function(req, res, next) {
  const categoria = req.query.categoria
  connection.connect();
  connection.query('SELECT * FROM polo_per_categoria WHERE categoria=\''+categoria+'\'', function (error, results, fields) {
    // error will be an Error if one occurred during the query
    // results will contain the results of the query
    // fields will contain information about the returned results fields (if any)
    
    console.log(results);
  });
  res.render('poli_vaccinali', { title: 'Home' });
});

module.exports = router;
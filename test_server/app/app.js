var createError = require('http-errors');
var express = require('express');
var path = require('path');

var homeRouter = require('./routes/home');
var poliVaccinaliRouter = require('./routes/scopri_categoria');
var prenotazioniRouter = require('./routes/prenota_appuntamento');
var riepilogoRouter = require('./routes/riepilogo');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');


app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(express.static(path.join(__dirname, 'public')));

app.use('/', homeRouter);
app.use('/scopri_categoria', poliVaccinaliRouter);
app.use('/prenota_appuntamento', prenotazioniRouter);
app.use('/riepilogo', riepilogoRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('errors');
});

module.exports = app;

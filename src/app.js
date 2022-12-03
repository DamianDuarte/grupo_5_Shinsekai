var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const session = require('express-session');
const methodOverride = require('method-override');

const localSession = require('./middlewares/localSession');

var mainRouter = require('./routes/main');
var productsRouter = require('./routes/products');
var userRouter= require('./routes/user');
var editRouter = require('./routes/edit');
var apiProductRouter = require('./routes/apiProducts');
var apiUserRouter = require('./routes/apiUsers');
var apiCategoryRouter = require('./routes/apiCategories');
var apiTagRouter = require('./routes/apiTags');
var apiSaleRouter = require('./routes/apiSales');
var apiAuthRouter = require ('./routes/apiAuth');

var app = express();

//* View engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//* Middlewares
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '..', 'public')));
app.use(methodOverride('_method'));
app.use(session(
  {
    secret: 'Shinsekai11',
    resave: false,
    saveUninitialized: true
  }));

//* Custom middlewares
app.use(localSession);

//* Routers
app.use('/', mainRouter);
app.use('/products', productsRouter);
app.use('/user', userRouter);
app.use('/edit', editRouter);
app.use('/api/products', apiProductRouter);
app.use('/api/users', apiUserRouter);
app.use('/api/categories', apiCategoryRouter);
app.use('/api/tags', apiTagRouter);
app.use('/api/sales', apiSaleRouter);
app.use('/api/auth', apiAuthRouter);

app.use(session(
  {
    secret: 'Shinsekai11',
    resave: false,
    saveUninitialized: true
  }));

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
  res.render('error');
});

module.exports = app;
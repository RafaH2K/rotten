const express = require ('express');
const morgan = require('morgan');
const app = express();
const profesRoutes = require('../routes/profes.routes.js')
const rankedRoutes = require('../routes/ranked.routes.js')
const loguinRoutes = require('../routes/login.routes.js')
const registerRoutes = require('../routes/register.routes.js')

app.use(express.json());

app.use(morgan('dev'))

app.use('/crud', profesRoutes);
app.use('/ranked', rankedRoutes);
app.use('/login', loguinRoutes);
app.use('/register', registerRoutes);
app.use('/', (req, res) =>{
    res.send('pagina principal');
})
module.exports = app;
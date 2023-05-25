const express = require('express');
const mongoose =require('mongoose');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const helmet = require('helmet');
const core = require('cors');
const  app = express();
const PORT = process.env.PORT || 5000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));
app.use(morgan('dev'));
app.use(helmet());
app.use(core());

mongoose.connect("mongodb://localhost:27017");

app.listen(PORT,()=>{
    console.log("server is running");
});
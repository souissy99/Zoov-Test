const express = require('express');
const app = express();
const bikesRouter = require('./Routes/bikes');

app.use((req, res, next) => {
	res.header("Access-Control-Allow-Origin", "*"); // update to match the domain you will make the request from
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS');
	next();
});

app.use('/bikes', bikesRouter);

app.listen(8081, () => {
	console.log('server running');
});
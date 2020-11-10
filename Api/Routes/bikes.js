const express = require('express');
const router = express.Router();
const dbConn  = require('../db');

// display bikes
router.get('/', (req, res, next) => {
	dbConn.query('SELECT * FROM bikes ORDER BY id desc', (err, rows) => {
		if (err) {
			res.send(JSON.stringify(err));
		} else {
			res.send(JSON.stringify(rows));
		}
	});
});

router.delete('/:id', (req, res, next) => {
	const id = req.params.id;

	dbConn.query(`DELETE FROM bikes WHERE id =${id}`, (err, rows) => {
		if (err) {
			res.send(JSON.stringify(err));
		} else {
			res.send(JSON.stringify(rows));
		}
	});
});


module.exports = router;

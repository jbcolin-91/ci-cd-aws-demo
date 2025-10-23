const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
	res.send('Hello from AWS CI/CD Demo!');
});

if (require.main === module) {
	app.listen(port, () => {
		console.log(`Server running on port ${port}`);
	});
}

module.exports = app;


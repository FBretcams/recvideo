const express = require('express');
const app = express();

app.get('/index', (req, res) => res.send('hola mundo'))

app.listen(3000);
console.log('port 3000')
'use strict';
/*jslint node: true */

var camoUrl = require('../')({
  host: 'https://camo.yourdomain.com',
  key: 'your_camo_key'
});

console.log(camoUrl('http://www.example.com/example.jpg'));

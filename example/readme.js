'use strict';
/*jslint node: true */

var camoUrl;


camoUrl = require('../')({
  host: 'https://camo.yourdomain.com',
  key: 'your_camo_key'
});

console.log(camoUrl('http://www.example.com/example.jpg'));



camoUrl = require('../')({
  host: 'https://camo.yourdomain.com',
  key: 'your_camo_key',
  type: 'path'
});

console.log(camoUrl('http://www.example.com/example.jpg'));

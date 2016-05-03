camo-url
--------

[![npm version](https://img.shields.io/npm/v/camo-url.svg?style=flat-square)](https://www.npmjs.com/package/camo-url)
[![Build Status](http://img.shields.io/travis/pine/node-camo-url/master.svg?style=flat-square)](https://travis-ci.org/pine/node-camo-url)
[![Coverage Status](https://coveralls.io/repos/pine613/node-camo-url/badge.svg?branch=master)](https://coveralls.io/r/pine/node-camo-url?branch=master)
[![Dependency Status](https://img.shields.io/david/pine/node-camo-url.svg?style=flat-square)](https://david-dm.org/pine/node-camo-url)
[![devDependency Status](https://img.shields.io/david/dev/pine/node-camo-url.svg?style=flat-square)](https://david-dm.org/pine/node-camo-url#info=devDependencies)

Create a image url by proxy that is [camo](https://github.com/atmos/camo).

## Getting started

```sh
$ npm install camo-url --save
```

## Examples
It's very easy to use.

```js
var camoUrl = require('camo-url')({
  host: 'https://camo.yourdomain.com',
  key: 'your_camo_key'
});

console.log(camoUrl('http://www.example.com/example.jpg'));
// => https://camo.yourdomain.com/c8b84571f98f34c41f7b4810a605e06d872eecd0?url=http%3A%2F%2Fwww.example.com%2Fexample.jpg
```

## References
### require('camo-url')(options)
Initialize this package.

 - options ... Type: `object` ... information of your camo server (optional)
   - host: host name (optional)
     - Type: `string`
     - Default: `'http://localhost:8081'`
   - key: camo key (optional)
     - Type: `string`
     - Default: `'0x24FEEDFACEDEADBEEFCAFE'`
   - type: proxied url type (optional)
     - Type: `'query'` or `'path'`
     - Default: `'query'`

### camoUrl(imageUrl)
Generate a proxied image URL.

 - imageUrl: an absolute URL of an image
   - Type: `string`
 - returns: proxied URL
   - Type: `string`

### camoUrl.digest(imageUrl)
Get digest of an image URL.

 - imageUrl: an absolute URL of an image
   - Type: `string`
 - returns: digest of the URL
   - Type: `string`

## FAQ
### Q. How do I create a GitHub style camo's URL?
A. Please try `type: 'path'` option.

```js
var camoUrl = require('camo-url')({
  host: 'https://camo.yourdomain.com',
  key: 'your_camo_key',
  type: 'path'
});

console.log(camoUrl('http://www.example.com/example.jpg'));
// => https://camo.yourdomain.com/c8b84571f98f34c41f7b4810a605e06d872eecd0/687474703a2f2f7777772e6578616d706c652e636f6d2f6578616d706c652e6a7067
```

## License
MIT License

'use strict'

require! {
  crypto
  url: Url
  xtend: extend
  'prelude-ls': { map, unchars }
}


defaults =
  host: 'http://localhost:8081'
  key: '0x24FEEDFACEDEADBEEFCAFE'
  type: \query


digest = (key, data) ~~>
  hmac = crypto.create-hmac(\sha1, key)
  hmac.update(data)
  hmac.digest(\hex)


query = (d, host, url) ->
  q = '?url=' + encode-URI-component(url)
  Url.resolve(host, d) + q


path = (d, host, url) ->
  Url.resolve(host, d) + '/' + hex-url(url)


hex-url = (url) ->
  buffer = new Buffer(url, \utf-8)
  bytes = Array.prototype.slice.call(buffer)

  bytes
    |> map (.to-string 16)
    |> unchars


module.exports = (options) ->
  options = extend(defaults, options)
  converter = switch options.type
    | \query => query
    | \path => path

  fn = (url) ->
    d = digest(options.key, url)
    converter(d, options.host, url)

  fn.digest = (digest options.key)

  fn

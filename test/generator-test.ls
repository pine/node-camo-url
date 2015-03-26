'use strict'

require! {
  '../lib/generator'
  chai: { expect }
}


describe 'Test for lib/generator.ls', (...) ->
  describe 'default options', (...) ->
    it 'should return a function', ->
      expect(generator()).to.be.a('function')
    
    it 'should generate a url with default options', ->
      url = 'http://example.com/example.jpg'
      proxied = 'http://localhost:8081/febb713c64afc2f987646d4eb1a1cabd6ac8a994?url=http%3A%2F%2Fexample.com%2Fexample.jpg'
      
      expect(generator()(url)).to.equal(proxied)
      
  
  describe 'query option', (...) ->
    it 'should generate a url with query options', ->
      url = 'http://example.com/example.jpg'
      proxied = 'http://localhost:8081/febb713c64afc2f987646d4eb1a1cabd6ac8a994?url=http%3A%2F%2Fexample.com%2Fexample.jpg'
      
      expect(generator( type: 'query' )(url)).to.equal(proxied)
  
  
  describe 'path option', (...) ->
    it 'should generate a url with path option', ->
      url = 'http://example.com/example.jpg'
      proxied = 'http://localhost:8081/febb713c64afc2f987646d4eb1a1cabd6ac8a994/687474703a2f2f6578616d706c652e636f6d2f6578616d706c652e6a7067'
      
      expect(generator( type: 'path' )(url)).to.equal(proxied)

  
  
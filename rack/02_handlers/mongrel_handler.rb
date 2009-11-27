#!/usr/bin/ruby

# Ruby script to run a Hello world rack app
# with a Mongrel handler included in rack.

require 'rubygems'; require 'rack'

class HelloWorld
  def call(env) 
    [ 200, {"Content-Type" => "text/html"}, ["Hello world!"] ]
  end  
end

app = HelloWorld.new
Rack::Handler::Mongrel.run app, :Port => 9292 # defaults to 8080

# More handlers available:
# Rack::Handler::WEBrick.run app, :Port => 9292 # defaults to 80
# Rack::Handler...
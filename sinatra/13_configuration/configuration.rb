require 'rubygems'
require 'sinatra'

set :foo, "bar"

# environment gets loaded by RACK_ENV value, development by default
# RACK_ENV=production ruby configuration.rb

configure :development do
  set :my_server, 'example.com'
end

configure :production do
  set :my_server, 'mysite.com'
end

get "/" do
  "Foo: #{options.foo}, Server: #{options.my_server}"
end


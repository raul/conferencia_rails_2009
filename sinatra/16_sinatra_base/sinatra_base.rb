require 'rubygems'
require 'sinatra/base' # not just 'sinatra'!!!

class MyApp < Sinatra::Base
  
  # Sinatra::Base has some configuration values
  # by default that are different from a raw Sinatra application
  
  get "/" do
    "Hi there!"
  end
  
end

MyApp.run!
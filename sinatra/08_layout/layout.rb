require 'rubygems'
require 'sinatra'

get '/' do
  erb :index
end

get '/naked' do
  erb :index, :layout => false
end

template :layout do
  "<hr /><%= yield %><hr />"
end

template :index do
  "Hello world!"
end
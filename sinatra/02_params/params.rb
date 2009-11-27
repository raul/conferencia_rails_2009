require 'rubygems'
require 'sinatra'

get "/hi/:name" do
  "Hello #{params[:name]}"
end

get "/bye/:name?" do # optional parameter
  if params[:name].nil?
    "Who are you?"
  else
    "Goodbye #{params[:name]}"
  end
end

# parameters can be accessed like block parameters:
get '/foo/:name/:surname' do |name, surname|
  "#{surname}, #{name} #{surname}"
end
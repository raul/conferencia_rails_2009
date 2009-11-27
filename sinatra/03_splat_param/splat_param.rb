require 'rubygems'
require 'sinatra'

# /raul/murciano/foobar/123/456:
# params[:splat] => ['raul/murciano','123/456']
# shows:
# Hello raul/murciano, 123/456!
get '/*/foobar/*' do
  "Hello #{params[:splat].join(', ')}!" 
end

# /raul/murciano/123
# params[:splat] => ['raul/murciano/123']
# shows:
# Bye raul/murciano/123!
get '/*' do
  "Bye #{params[:splat].join(', ')}!"
end
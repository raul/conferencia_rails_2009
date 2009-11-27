require 'rubygems'
require 'sinatra'

# Visit /fail to see a generic error page,
#       /epic-fail to see an error page for custom error
#       / to see a nice 404

# - - -  Controllers  - - - #
get '/epic-fail' do
  raise EpicFailError, 'EPIC FAIL!!!'
  "Visit /fail to see error page and /foo to see a nice 404"
end

get '/fail' do
  the_app_fails_here
end

# - - -  Error management  - - - #

# enabling show_exceptions we would see the error backtrace
set :show_exceptions, false

# generic error
error do
  "Flying whale goes here. #{request.env['sinatra.error'].to_yaml}"
end

# customized error
class EpicFailError < Exception; end
error EpicFailError do
  "Oh, oh: #{request.env['sinatra.error'].message}"
end

# 404:
not_found do
  "Awesome 404 screen"
end

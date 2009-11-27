require 'rubygems'
require 'sinatra'

class UpcaseFilter
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = @app.call(env)
    body.each{ |str| str.upcase! }
    [ status, headers, body ]
  end
end

use UpcaseFilter

get "/" do
  "Hello world!"
end
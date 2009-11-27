# RAILS_ROOT/app/metal/frank.rb

# Allow the metal piece to run in isolation
unless defined?(Rails)
  require(File.dirname(__FILE__) + "/../../config/environment") 
end

# - - -  application  - - - #
require 'sinatra/base'
class AwesomeSinatraApp < Sinatra::Base
  get "/frank" do
    "New York, New York"
  end
end

# - - -  metal invokes the app  - - - #
class Frank
  def self.call(env)
    @@app ||= AwesomeSinatraApp.new
    if env["PATH_INFO"] =~ /^\/frank/
      @@app.call(env)
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end

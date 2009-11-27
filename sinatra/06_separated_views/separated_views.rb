require 'rubygems'
require 'sinatra'

# The views directory can be configured with this setting:
# set :views, Proc.new { File.join(root, 'views') }
#
# And the root is configurable too:
# set :root, File.dirname(__FILE__)

get '/feed.xml' do
  content_type :xml
  builder :feed
end

get '/' do
  erb :form
end

post '/' do
  @username = params[:user][:first_name] + ' ' + params[:user][:last_name]
  erb :greeting
end

# Sinatra looks for views on the source file first and at /views later
# ...so if I write a @@form view down here the /views/form.erb will be ignored

__END__


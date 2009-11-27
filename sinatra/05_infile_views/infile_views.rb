require 'rubygems'
require 'sinatra'

get '/' do
  @now = Time.now.strftime("%H:%M:%S")
  erb :home
end

# views can be declared with a block...
template :home do
  "This is my view at <strong><%= @now %></strong>"
end

get "/about" do
  erb :about
end

# ...or after the source code!

__END__

@@about
In-file views sample application for Conf.Rails 2009
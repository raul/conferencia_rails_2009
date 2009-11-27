require 'rubygems'
require 'sinatra'

# helpers are available in controllers and views

helpers do
  def time_format(time)
    time.strftime("%H:%M:%S")
  end
end

get '/' do
  some_var = time_format(Time.now)
  erb :index
end

get '/inline' do
  "Using helper in an inline view at #{time_format(Time.now)}"
end

__END__

@@index
Using helper in a separate view at <%= time_format(Time.now) %>

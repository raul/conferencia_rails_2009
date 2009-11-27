require 'rubygems'
require 'sinatra'

# - - -  Before filters  - - - # 
before do 
  set_time
end

def set_time
  @time = Time.now.strftime("%H:%M:%S")
end

# - - -  Controllers - - - #
get '/' do
  "Hello at #{@time}"
end

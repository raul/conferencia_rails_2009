require 'rubygems'
require 'sinatra'

get '/' do
  @now = Time.now.strftime("%H:%M:%S")
  erb 'Hello world at <%= @now %>!'
end

get '/haml' do 
  haml '%h1 Hi Conf.Rails!'
end

get '/foo.xml' do
  content_type 'text/xml'
  builder do |xml|
    xml.parent do
      xml.child "Hi there!"
    end
  end
end

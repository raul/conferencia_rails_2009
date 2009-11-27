require 'rubygems'
require 'sinatra'

# partials are not built-in
helpers do
  def erb_partial(template, options={})
    erb template, options.merge!(:layout => false)
  end
end

get '/' do
  @where = 'Conferencia Rails 2009'
  erb :index
end

__END__

@@index
Partial: <%= erb_partial :my_partial, :locals => {:place => @where} %>

@@my_partial
<strong>I'm talking at <%= place %></strong>

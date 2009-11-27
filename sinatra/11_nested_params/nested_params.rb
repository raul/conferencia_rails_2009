require 'rubygems'
require 'sinatra'

get '/' do
  erb :form
end

post '/' do
  @username = params[:user][:first_name] + ' ' + params[:user][:last_name]
  "Hello #{@username}!"
end

template :form do
<<-HTML
<form action="/" method="post">

  <label for="user_first_name">First name</label>
  <input type="text" name="user[first_name]" id="user_first_name"></input>

  <label for="user_last_name">Last name</label>
  <input type="text" name="user[last_name]" id="user_last_name"></input>

  <input type="submit" value="submit">

</input>
HTML
end

require 'rubygems'
require 'sinatra'

# - - - - - -  Model  - - - - - - #
require 'dm-core'
DataMapper.setup(:default, 'sqlite3::memory:')

class User
  include DataMapper::Resource
  property :id,     Serial
  property :name,   String
  property :email,  String
end

User.auto_migrate!


# - - - - - - Controller - - - - - #
  
get '/' do
  erb :index
end

get '/new' do
  erb :new
end

post '/' do
  @user = User.new params[:user]
  @user.save
  redirect '/'
end

get '/edit/:id' do
  @user = User.get params[:id]
  erb :edit
end

put '/:id' do
  @user = User.get params[:id]
  @user.attributes = params[:user]
  @user.save
  redirect '/'  
end

delete '/:id' do
  @user = User.get params[:id]
  @user.destroy
  redirect '/'  
end  

# - - - - - - - Views - - - - - - - #

template :index do
<<-HTML
<h1>Users</h1>
<a href="/new">Add new user</a>
<ul>
<% for user in User.all do %>
  <li>
    <%= user.name %> (<%= user.email %>)
    <a href="/edit/<%= user.id %>">edit</a>
    <form action="/<%= user.id %>" method="post" style="display:inline">
      <input type="hidden" name="_method" value="delete" />
      <input type="submit" value="delete" />
    </form>
  </li>
<% end %>
</ul>
HTML
end

template :new do
<<-HTML
<h1>Adding a new user</h1>
<form action="/" method="post">
  <label for="user_name">User</label>
  <input type="text" id="user_name" name="user[name]"></input>
  <label for="user_name">e-mail</label>
  <input type="text" id="user_email" name="user[email]"></input>
  <input type="submit" value="create" />
</input>
HTML
end

template :edit do
<<-HTML
<h1>Editing a user</h1>
<form action="/<%= @user.id %>" method="post">
  <input type="hidden" name="_method" value="put" />
  <label for="user_name">User</label>
  <input type="text" id="user_name" name="user[name]" value="<%= @user.name %>" />
  <label for="user_name">e-mail</label>
  <input type="text" id="user_email" name="user[email]" value="<%= @user.email %>" />
  <input type="submit" value="update" />
</input>
HTML
end

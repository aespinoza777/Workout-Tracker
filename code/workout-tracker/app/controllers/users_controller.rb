class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    redirect_if_not_logged_in
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    user = User.new(email: params[:email], name: params[:name], username: params[:username], age: params[:age], gender: params[:gender], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect "/users"
    else
      redirect "/users/new"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get "/logout" do
    session[:user_id] = nil
    redirect "/users/new" 
  end

  get "/login" do
    erb :"users/login.html"
  end

  post "/login" do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users"
    else 
      redirect "/login"
    end
  end
end

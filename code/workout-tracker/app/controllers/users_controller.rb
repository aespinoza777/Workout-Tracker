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
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect "/users"
    else
      redirect "/users/new"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    redirect_if_not_logged_in
    @user = User.find(params[:id])
    if current_user == @user
      erb :"/users/show.html"
    else 
      redirect "/users/#{current_user.id}"
    end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    redirect_if_not_logged_in
    @user = User.find(params[:id])
    if current_user == @user
      erb :"/users/edit.html"
    else
      redirect "/users/#{current_user.id}/edit"
    end 
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect_if_not_logged_in
    user = User.find(params[:id])
    if current_user == user
      user.update(email: params[:email], name: params[:name], username: params[:username], age: params[:age], gender: params[:gender])
    end
    redirect "/users/#{current_user.id}"
  end
  

  # DELETE: /users/5/delete
  delete "/users/:id" do
    redirect_if_not_logged_in
    user = User.find(params[:id])
    if current_user == user
      session[:user_id] = nil
      user.destroy
    end
    redirect "/users/new"
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

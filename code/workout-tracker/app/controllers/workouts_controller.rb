class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
    redirect_if_not_logged_in
    @workouts = current_user.workouts
    erb :"/workouts/index.html"
  end

  # GET: /workouts/new
  get "/workouts/new" do
    redirect_if_not_logged_in
    erb :"/workouts/new.html"
  end

  # POST: /workouts
  post "/workouts" do
    redirect_if_not_logged_in
    workout = Workout.new(name: params[:name], completed: params[:completed], duration: params[:duration], user: current_user)
    if workout.save 
      redirect "/workouts"
    else
      redirect "/workouts/new"
    end
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    erb :"/workouts/show.html"
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    if current_user == @workout.user
      erb :"/workouts/edit.html"
    else
      redirect "/workouts"
    end

  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    if current_user == @workout.user
      @workout.update(name: params[:name], completed: params[:completed], duration: params[:duration])
    end
    redirect "/workouts"
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id" do
    redirect_if_not_logged_in
    workout = Workout.find(params[:id])
    if current_user == workout.user
      workout.destroy
    end
    redirect "/workouts"
  end
end

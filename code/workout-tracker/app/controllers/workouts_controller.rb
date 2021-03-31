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
    workout = Workout.new(name: params[:name], completed: params[:completed], duration: params[:duration], user: current_user)
    if workout.save 
      redirect "/workouts"
    else
      redirect "/workouts/new"
    end
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    erb :"/workouts/show.html"
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    @workout = Workout.find(params[:id])
    erb :"/workouts/edit.html"
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    @workout = Workout.find(params[:id])
    @workout.update(name: params[:name], completed: params[:completed], duration: params[:duration])
    redirect "/workouts"
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id" do
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect "/workouts"
  end
end

require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
                  set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
  end

  get "/" do
    erb :welcome
  end


  helpers do
    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def logged_in?
      !!session[:user_id]
    end
  end



end

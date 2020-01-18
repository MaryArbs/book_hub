require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "i_love_books"
  end

  get "/" do
    erb :homepage
  end 

 
  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/failure"
        # redirect "/login?error=You have to be logged in to do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end



require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "i_love_books"
  end

  get "/" do
    binding.pry
    erb :homepage
  end 

 
  helpers do


    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
      
    end
  end 

end



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

    def logged_in?
        !!current_user
    end

    def current_user # if a is undefined or falsey, then evaluate b and set a to the result. Equivalently, if a is defined and evaluates to truthy, then b is not evaluated, and no assignment takes place.
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
       end
    end
  end 




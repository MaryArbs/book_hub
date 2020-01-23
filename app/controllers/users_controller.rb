require './config/environment'

class UsersController < ApplicationController


  get "/login" do
		erb :'user/login'
  end
  
  post "/login" do 
    if params[:username].empty? || params[:password].empty?
      redirect to '/login'
    end 
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/oprah_books"
    else
      redirect "/signup"
    end
  end 
    
    
  get '/signup' do
    erb :'user/signup'
  end

  post "/signup" do
   if params[:username].empty? || params[:password].empty?
      redirect to '/failure'
    end
    
    if User.find_by(username: params[:username])
      redirect '/login'
    end
      user = User.create(params)
      session[:user_id] = user.id 
      redirect to '/'
  end
  

  get "/failure" do
		erb :'user/failure'
	end


  get '/logout' do 
    session.clear 
    erb :'/user/logout'
  end 

  
end 
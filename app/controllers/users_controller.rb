require './config/environment'

class UsersController < ApplicationController


  get '/signup' do
    erb :'user/signup'
  end

  post "/signup" do
    
    if params[:username].empty?
      redirect to '/failure'
    end
    if params[:password].empty?
      redirect to '/failure'
    end 
      user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      redirect to '/login'
    else
      redirect to '/failure'
    end
  end

  get "/failure" do
		erb :'user/failure'
	end

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
      redirect "/oprah"
    else
      redirect "/homepage"
    end
  end

  
end 
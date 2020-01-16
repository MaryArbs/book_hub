require './config/environment'

class UsersController < Sinatra::Base


  get "/signup" do
    erb :'user/signup'
  end

  post "/signup" do
    if params[:username].empty?
      redirect to '/signup'
    end
    if params[:password].emtpy
      redirect to '/signup'
    end 
      user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      redirect '/login'
    else
      redirect '/signup'
    end
  end
  
end 
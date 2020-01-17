class BooksController < ApplicationController

    get '/oprah' do
        if logged_in?
            @user = current_user
        end 
        @books = Book.all  #index showing all Oprah's books
        erb :'book/oprah'
    end

    get '/mybooks' do # list of user's books
        if !logged_in?
            redirect '/login'
        end
        erb :'book/mybooks'
    end 
    
    get '/oprah/new' do 
        @books = Book.all 
       erb :'book/new'
    end 

    post '/oprah' do #create new save and add to book list
        @user = current_user 
        @save = Save.create(book_id: params[:book_id], user_id: current_user.id)
        binding.pry
        erb :'book/mybooks'
    end 
    


    
    get '/mybooks' do #go to user's account with their book list
         erb :'book/mybooks'
    end
    

   
    
    
end 

#edit by :id
#delete book 
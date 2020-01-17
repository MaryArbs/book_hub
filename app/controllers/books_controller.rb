class BooksController < ApplicationController

    get '/oprah' do
        if logged_in?
            @user = current_user
        end 
        @books = Book.all  #index showing all Oprah's books
        erb :'book/oprah'
    end
    
    get '/mybooks' do #go to user's account with their book list
        if !logged_in?
            redirect '/login'
        end 
         @my_books = current_user.books
         erb :'book/mybooks'
    end 
    

    # post '/mybooks/new' do  #submit a form to add/create a new book
    #     @user = current_user
    #     book = Book.create(params[:book])
    #     erb :'book/new'
    # end 
      
    
end 

#edit by :id
#delete book 
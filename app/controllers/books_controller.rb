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

    get '/mybooks/new' do 
        if !logged_in?
            redirect '/login'
          end 
          erb :'books/new'
        end 
    end 
    

    post '/mybooks/new' do  #create new save/book already created in scraper
        @user = current_user
        book = Save.create(params[:book_id])
        save.user_id = current_user.id
        erb :'book/new'
    end 
      
    
end 

#edit by :id
#delete book 
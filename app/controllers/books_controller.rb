class BooksController < ApplicationController


    get '/oprah_books' do
        @user = current_user
        @books = Book.all 
         #index showing all Oprah's books
        erb :'book/oprah'
    end
    

    get '/mybooks/new' do  #form to create new book 
        @books = Book.all 
        
        erb :'book/new'
    end 

    get "/mybooks" do 
        @user = current_user
        erb :'book/mybooks'
    end 

    post '/mybooks'  do  #create new save and add to book list     
         book = Book.find(params[:book_id])
         Save.create(book: book,  user: current_user)
         redirect "/mybooks"
    end 

    get '/mybooks/:id' do 
        @book = Book.find(params[:id])
        erb :'book/single' # show individual book on page, so user can delete # show page 
    end 

    delete '/mybooks/:id/delete' do
        @book = Book.find(params[:id])
        @book.delete
        redirect "/mybooks"
    end

end 

    
class BooksController < ApplicationController


    get '/oprah_books' do
        @user = current_user
        @books = Book.all  #index showing all Oprah's books
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

    get '/mybooks/:book_id' do #go to user's account with their book list
          @user = current_user
          @book = Book.find(params[:book_id])
          
          erb :'book/show' # show book on  user book list
    end 

    post '/mybooks'  do  #create new save and add to book list      goodreads.com/books
        book = Book.find(params[:book_id])
        Save.create(book: book,  user: current_user)
        redirect "/mybooks"
    end 

    get '/mybooks/:book_id' do 
        @book = Book.find(params[:book_id]) 
    
        erb :'/book/single'
      end 

    delete '/mybooks/:book_id' do
        Book.destroy(params[:book_id])
        redirect "/mybooks"
    end

end 

    


#edit by :id
#delete book 
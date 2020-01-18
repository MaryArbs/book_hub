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

    # get '/mybooks/:book_id' do #go to user's account with their book list
    #       @user = current_user
    #       @book = UserBook.find_by(book_id: params[:book_id])
          
    #       erb :'book/mybooks' # show book on  user book list
    # end 

    post '/mybooks'  do  #create new save and add to book list      goodreads.com/books
        book = Book.find_by(id: params[:id])
        @book = Save.create( book: book,  user: current_user)
        binding.pry
        redirect "/mybooks"
    end 

end 

    


#edit by :id
#delete book 
class BooksController < ApplicationController


    get '/oprah_books' do
        @user = current_user
        @books = Book.all 
         #index showing all Oprah's books
        erb :'book/oprah'
    end
    

    get '/mybooks/new' do  #form to create new book 
        all_books = Book.all 
        user_book_ids = current_user.books.map{|book| book.id}
        @books = all_books.reject{|book|  user_book_ids.include? book.id }
        
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
        book = Book.find(params[:id])
        @save = Save.find_by(book: book, user: current_user)
        erb :'book/single' # show individual book on page, so user can delete # show page 
    end 

    delete '/mybooks/:id/delete' do
        book = Book.find(params[:id])
        @save = Save.find_by(book: book, user: current_user)
        if @save 
        @save.destroy
        end 
        redirect "/mybooks"
    end

end 

    
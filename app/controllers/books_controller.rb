class BooksController < ApplicationController


    get '/oprah_books' do
        if !logged_in? 
            redirect '/login'
        end 
        @books = Book.all 
         #index showing all Oprah's books
        erb :'book/oprah'
    
    end
    

    get '/mybooks/new' do      #form to create new book  #if user_book.id matching book.id it will reject 
        if !logged_in?
            redirect '/login'
        end     
        all_books = Book.all 
        user_book_ids = current_user.books.map{|book| book.id}
        @books = all_books.reject{|book|  user_book_ids.include? book.id }
        
        erb :'book/new'
    end 

    get "/mybooks" do 
        if !logged_in?
           redirect '/login'
        end 
        @user = current_user
        erb :'book/mybooks'
    end 

    post '/mybooks'  do       #create new save and add to book list  
        if !logged_in?
            redirect '/login'
        end     
        book = Book.find(params[:book_id])
        @save = Save.new(book: book,  user: current_user)
        if @save.save
        redirect "/mybooks"
        else
        redirect '/mybooks/new'
        end 
    end 

    get '/mybooks/:id' do 
        if !logged_in?
            redirect '/login'
        end 
        book = Book.find(params[:id])
        @save = Save.find_by(book: book, user: current_user)
        erb :'book/single' # show individual book on page, so user can delete # show page 
    end 

    delete '/mybooks/:id/delete' do
        if !logged_in?
            redirect '/login'
        end 
        book = Book.find(params[:id])
        @save = Save.find_by(book: book, user: current_user)
        if @save 
        @save.destroy
        end 
        redirect "/mybooks"
    end

end 

    
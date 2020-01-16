class BooksController < ApplicationController

    get '/book_list' do
        if logged_in?
            @user = current_user
        end 
        @books = Scraper.all  #index showing all Oprah's books
        erb :'book/book_list'
    end 
end 
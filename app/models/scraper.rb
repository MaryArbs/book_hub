# require 'open-uri'
# require 'nokogiri'
# require 'pry'

# class Scraper

    
#  def scrape_book_list
#   book_base_url = "https://www.goodreads.com/"
#   site = "https://www.goodreads.com/list/show/216.Oprah_s_Book_Club_Picks"
#   doc = Nokogiri::HTML(open(site))
#   title = doc.css("a.bookTitle").each do |element|
#    puts element.css('span').text
#    puts book_base_url + element.attribute('href')
#    profile_url = book_base_url + title 
#    Book.create(title, profile_url)
#    end 
#   end 
 
#  end 
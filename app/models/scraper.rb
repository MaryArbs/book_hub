# require 'open-uri'
# require 'nokogiri'
# require 'pry'

class Scraper


  def scrape_books
    book_base_url = "https://www.goodreads.com/"
    site = "https://www.goodreads.com/list/show/216.Oprah_s_Book_Club_Picks"
    doc = Nokogiri::HTML(open(site))
    titles = []
    authors = []
    urls = []
    doc.css("a.bookTitle").each do |element|
      titles << element.css('span').text
    end
    doc.css('a.authorName').each do |element|
      authors << element.css('span').text
    end
    doc.css("a.bookTitle").each do |element|
      urls << book_base_url + element.attribute('href') 
    end
    titles.each_with_index do |title, index|
      Book.create(title: title, author: authors[index], profile_url: urls[index])
    end
  end
end  
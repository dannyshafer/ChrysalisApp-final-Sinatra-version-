require 'nokogiri'
require 'open-uri'

symbol = "aapl"
url = "http://finance.yahoo.com/q/pr?s=" + symbol +"+Profile"
doc = Nokogiri::HTML(open(url))

p doc.css('p')[1].text


require 'nokogiri'
require 'open-uri'
require 'pp'

symbol = "aapl"
url = "http://finance.yahoo.com/q/pr?s=" + symbol +"+Profile"
url2 = "http://finance.yahoo.com/q?s="+ symbol
doc = Nokogiri::HTML(open(url))
doc2 = Nokogiri::HTML(open(url2))

pp doc.css('p')[1].text

pp doc2.css('.yfnc_tabledata1')[5].text


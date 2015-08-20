require 'nokogiri'
require 'open-uri'
require 'pp'

# weekly performance in this week is end of week performance minus beginning of week performance divided by end of week performance times 100 ((2084.07 - 2095.27) / 2095.27) * 100

# This is for the S&P weekly performance
container = []
doc = Nokogiri::HTML(open("https://www.google.com/finance/historical?q=INDEXSP:.INX"))
doc.css('.rgt').each do |i|
  container << i.text[0..7]
end

index_week_end = container[8].gsub(/[^\d^\.]/, '').to_f
index_week_start = container[27].gsub(/[^\d^\.]/, '').to_f
index_week_performance = ((index_week_end - index_week_start) / index_week_end * 100).round(2)

# Stock weekly performance
# weekly performance in this week is end of week performance minus beginning of week performance divided by end of week performance times 100 ((113.49 - 112.95) / 112.95) * 100
# container2 = []
# doc2 = Nokogiri::HTML(open("http://finance.yahoo.com/q/hp?s=aapl+Historical+Prices"))
# doc2.css('.yfnc_tabledata1').each do |i|
#   if i.include?("Dividend")
#     container2[i - 1].pop
#     next
#   else
#     container2 << i.text
#   end
# end
# stock_week_end = container2[4].gsub(/[^\d^\.]/, '').to_f
# stock_week_start = container2[31].gsub(/[^\d^\.]/, '').to_f
# stock_week_performance = ((stock_week_end - stock_week_start) / stock_week_end * 100).round(2)

# if stock_week_performance > index_week_performance
#   puts "The stock performed better than the market by " + (stock_week_performance - index_week_performance).round(2).to_s + " percent."
# else
#   puts "The stock underperformed the market by " + (index_week_performance - stock_week_performance).round(2).to_s + " percent."
# end

stocks = ["aapl", "orcl", "hpq"]
basket_week_performance = 0
stocks.each do |i|
  container2 = []
  doc2 = Nokogiri::HTML(open("http://finance.yahoo.com/q/hp?s="+ i +"+Historical+Prices"))
  doc2.css('.yfnc_tabledata1').each do |i|
    if i.include?("Dividend")
      container2[i - 1].pop
      next
    else
      container2 << i.text
    end
  end
  stock_week_end = container2[4].gsub(/[^\d^\.]/, '').to_f
  stock_week_start = container2[31].gsub(/[^\d^\.]/, '').to_f
  basket_week_performance += (((stock_week_end - stock_week_start) / stock_week_end * 100).round(2))/stocks.length
end

p basket_week_performance

# if basket_week_performance > index_week_performance
#   puts "The basket performed better than the market by " + (basket_week_performance - index_week_performance).round(2).to_s + " percent."
# else
#   puts "The basket underperformed the market by " + (index_week_performance - basket_week_performance).round(2).to_s + " percent."
# end


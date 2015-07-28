require 'nokogiri'
require 'open-uri'

#finance.yahoo.com/q?s=fbiox
# text_input = ARGV.join("").to_s
# fund_symbol = ("http://www.finance.yahoo.com/q?s=" + text_input + ∫"+Performance")
fund_symbol = "http://finance.yahoo.com/q/hl?s=FBIOX+Holdings"
doc = Nokogiri::HTML(open(fund_symbol))
percentages = []
holdings = []
ratios = []

doc.css('.yfnc_datamoddata1').each do |i|
  percentages << i.text
end

doc.css('.yfnc_tabledata1').each do |i|
  holdings << i.text
end

doc.css('.yfnc_tabledata1').each do |i|
  ratios << i.text
end


#Overall Portfolio Composition
cash_percent  = percentages[0]
stocks_percent  = percentages[1]
bonds_percent  = percentages[2]
other_percent  = percentages[3]

#Top ten holdings and percentages of portfolio
first_holding = holdings[0]
first_holding_symbol = holdings[1]
first_holding_percent = holdings[2]

second_holding = holdings[4]
second_holding_symbol = holdings[5]
second_holding_percent = holdings[6]

third_holding = holdings[8]
third_holding_symbol = holdings[9]
third_holding_percent = holdings[10]

fourth_holding = holdings[12]
fourth_holding_symbol = holdings[13]
fourth_holding_percent = holdings[14]

fifth_holding = holdings[16]
fifth_holding_symbol = holdings[17]
fifth_holding_percent = holdings[18]

sixth_holding = holdings[20]
sixth_holding_symbol = holdings[21]
sixth_holding_percent = holdings[22]

seventh_holding = holdings[24]
seventh_holding_symbol = holdings[25]
seventh_holding_percent = holdings[26]

eighth_holding = holdings[28]
eighth_holding_symbol = holdings[29]
eighth_holding_percent = holdings[30]

ninth_holding = holdings[32]
ninth_holding_symbol = holdings[33]
ninth_holding_percent = holdings[34]

tenth_holding = holdings[36]
tenth_holding_symbol = holdings[37]
tenth_holding_percent = holdings[38]

#Ratios
price_earnings = holdings[41]
price_earnings_cat = holdings[42]

price_book = holdings[44]
price_book_cat = holdings[45]

price_sales = holdings[47]
price_sales_cat = holdings[48]

price_cashflow = holdings[50]
price_cashflow_cat = holdings[51]

median_mkt_cap = holdings[53]
median_mkt_cap_cat = holdings[54]

three_year_earnings_growth = holdings[56]
three_year_earnings_growth_cat = holdings[57]

puts three_year_earnings_growth
puts three_year_earnings_growth_cat





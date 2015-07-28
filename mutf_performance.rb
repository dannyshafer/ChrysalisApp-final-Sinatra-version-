require 'nokogiri'
require 'open-uri'

#finance.yahoo.com/q?s=fbiox
# text_input = ARGV.join("").to_s
# fund_symbol = ("http://www.finance.yahoo.com/q?s=" + text_input + ∫"+Performance")
fund_symbol = "http://finance.yahoo.com/q/pm?s=FBIOX+Performance"
doc = Nokogiri::HTML(open(fund_symbol))
stats = []
returns = []

doc.css('.yfnc_datamoddata1').each do |i|
  stats << i.text
end

doc.css('.yfnc_tabledata1').each do |i|
  returns << i.text
end

#Performance Overview
Number_of_Yrs_Up = stats[3]
Number_of_Yrs_Down = stats[4]
Best_One_Yr_Total_Return = stats[5]
Worst_One_Yr_Total_Return = stats[6]
Best_Three_Yr_Total_Return = stats[7]
Worst_Three_Yr_Total_Return = stats[8]

#Load-Adjusted Returns
one_yr_load_adjusted_returns = stats[9]
three_yr_load_adjusted_returns = stats[10]
five_yr_load_adjusted_returns = stats[11]
ten_yr_load_adjusted_returns = stats[12]

#Annual Returns
twenty_fourteen_returns = returns[9]
twenty_thirteen_returns = returns[15]
twenty_twelve_returns = returns[21]
twenty_eleven_returns = returns[27]
twenty_ten_returns = returns[33]
twenty_nine_returns = returns[39]
twenty_eight_returns = returns[45]
twenty_seven_returns = returns[51]
twenty_six_returns = returns[57]
twenty_five_returns = returns[63]


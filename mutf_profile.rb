require 'nokogiri'
require 'open-uri'

#finance.yahoo.com/q?s=fbiox
# text_input = ARGV.join("").to_s
# fund_symbol = ("http://www.finance.yahoo.com/q?s=" + text_input +"+Profile")
fund_symbol = "http://finance.yahoo.com/q/pr?s=FBIOX+Profile"
doc = Nokogiri::HTML(open(fund_symbol))
stats = []

doc.css('.yfnc_datamoddata1').each do |i|
  stats << i.text
end

fund_family = stats[1]
fund_inception = stats[6]

Min_Initial_Investment = stats[7]
Min_Initial_Investment_IRA = stats[8]
Min_Initial_Investment_AIP = stats[9]
Min_Subsequent_Investment = stats[10]
Min_Subsequent_Investment_IRA = stats[11]
Min_Subsequent_Investment_AIP = stats[12]

Last_Dividend = stats[13]
Last_Cap_Gain = stats[14]
Annual_Holdings_Turnover = stats[15]
Average_for_Category = stats[16]

Annual_Report_Expense_Ratio = stats[17]
Annual_Report_Expense_Ratio_Category_Avg = stats[18]
Prospectus_Net_Expense_Ratio = stats[19]
Prospectus_Net_Expense_Ratio_Category_Avg = stats[20]
Prospectus_Gross_Expense_Ratio = stats[21]
Prospectus_Gross_Expense_Ratio_Category_Avg = stats[22]
Max_12b1_Fee = stats[23]
Max_12b1_Fee_Category_Avg = stats[24]
Max_Front_End_Sales_Load = stats[25]
Max_Front_End_Sales_Load_Category_Avg = stats[26]
Max_Deferred_Sales_Load = stats[27]
Max_Deferred_Sales_Load_Category_Avg = stats[28]
Three_Yr_Expense_Projection = stats[29]
Three_Yr_Expense_Projection_Category_Avg = stats[30]
Five_Yr_Expense_Projection = stats[31]
Five_Yr_Expense_Projection_Category_Avg = stats[32]
Ten_Yr_Expense_Projection = stats[33]
Ten_Yr_Expense_Projection_Category_Avg = stats[34]



require 'nokogiri'
require 'open-uri'

#finance.yahoo.com/q?s=fbiox
# text_input = ARGV.join("").to_s
# fund_symbol = ("http://www.finance.yahoo.com/q?s=" + text_input + "+Performance")
fund_symbol = "http://finance.yahoo.com/q/rk?s=FBIOX+Risk"
doc = Nokogiri::HTML(open(fund_symbol))
stats = []
risks = []

doc.css('.yfnc_datamoddata1').each do |i|
  stats << i.text
end

doc.css('.yfnc_tabledata1').each do |i|
  risks << i.text
end

#Risk Overview
morningstar_risk_rating = stats[0]
num_yrs_up = stats[1]
num_yrs_down = stats[2]
best_one_year_return = stats[3]
worst_one_year_return = stats[4]

#Risk Stats
three_yr_alpha = risks[1]
three_yr_alpha_cat = risks[2]
three_yr_beta = risks[4]
three_yr_beta_cat = risks[5]
three_yr_mean_annual_return = risks[7]
three_yr_mean_annual_return_cat = risks[8]
three_yr_r_squared = risks[10]
three_yr_r_squared_cat = risks[11]
three_yr_std_deviation = risks[13]
three_yr_std_deviation_cat = risks[14]
three_yr_sharpe_ratio = risks[16]
three_yr_sharpe_ratio_cat = risks[17]
three_yr_treynor_ratio = risks[19]
three_yr_treynor_ratio_cat = risks[20]

five_yr_alpha = risks[22]
five_yr_alpha_cat = risks[23]
five_yr_beta = risks[25]
five_yr_beta_cat = risks[26]
five_yr_mean_annual_return = risks[28]
five_yr_mean_annual_return_cat = risks[29]
five_yr_r_squared = risks[31]
five_yr_r_squared_cat = risks[32]
five_yr_std_deviation = risks[34]
five_yr_std_deviation_cat = risks[35]
five_yr_sharpe_ratio = risks[37]
five_yr_sharpe_ratio_cat = risks[38]
five_yr_treynor_ratio = risks[40]
five_yr_treynor_ratio_cat = risks[41]

ten_yr_alpha = risks[43]
ten_yr_alpha_cat = risks[44]
ten_yr_beta = risks[46]
ten_yr_beta_cat = risks[47]
ten_yr_mean_annual_return = risks[49]
ten_yr_mean_annual_return_cat = risks[50]
ten_yr_r_squared = risks[52]
ten_yr_r_squared_cat = risks[53]
ten_yr_std_deviation = risks[55]
ten_yr_std_deviation_cat = risks[56]
ten_yr_sharpe_ratio = risks[58]
ten_yr_sharpe_ratio_cat = risks[59]
ten_yr_treynor_ratio = risks[61]
ten_yr_treynor_ratio_cat = risks[62]

require 'nokogiri'
require 'open-uri'

#finance.yahoo.com/q?s=fbiox
text_input = ARGV.join("").to_s
fund_url = ("http://www.finance.yahoo.com/q?s=" + text_input)

doc = Nokogiri::HTML(open(fund_url))
name = doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.rtq_div').css('.yui-g').css('.yfi_rt_quote_summary').css('h2').text
price = doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.rtq_div').css('.yui-g').css('.yfi_rt_quote_summary').css('.yfi_rt_quote_summary_rt_top.sigfig_promo_1').css('.time_rtq_ticker').text.to_f
morningstar_rating = doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_fund_basics').css('.bd').css('table').css('tr').css('td').css('.yfnc_tabledata1.yfi_morning_star_rating').to_s[73]
crunched = doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.first.yfi-start-content').css('.yfi_quote_summary').css('.rtq_table').css('table').css('tr').css('td:nth-child(2)').text
expanded = crunched.split("")
ytd_return = expanded[5..9].join("").to_f
div_yield = expanded[-5..-1].join("").to_f
top_holdings = []
fund_basics = []
performance_and_risk_stage = []


doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_fund_basics').css('.bd').css('table').css('td').each do |i|
  fund_basics << i.text
end
total_assets = fund_basics[3]
category = fund_basics[4]
expense_ratio = fund_basics[5]

doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_top_holdings').css('.bd').css('table').css('td').css('.name').each do |equity|
  top_holdings << equity.text
end


doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_perf_risk').css('.bd').css('table').css('td').each do |i|
  performance_and_risk_stage << i.text
end

five_yr_return = performance_and_risk_stage[3]
rank_in_category = performance_and_risk_stage[5]
percent_rank_in_category = performance_and_risk_stage[7]
three_yr_beta = performance_and_risk_stage[9]
morningstar_risk_rating = performance_and_risk_stage[11]

description = doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_business_summary').css('.bd').text[0..-10]

puts description
puts ""
puts "The fund is #{name} and its price is $#{price}. Its year to date return is #{ytd_return}% and it has a dividend yield of #{div_yield}% per year."
puts ""
puts "The fund's average return for the past five years is #{five_yr_return}. It is ranked number #{rank_in_category} in its category, which is the top #{percent_rank_in_category} of all #{category} funds. Its three-year beta is #{three_yr_beta} and it holds a Morningstar Risk Rating of #{morningstar_risk_rating}."
puts ""
puts "Its top holdings are #{top_holdings.to_s}. Its morningstar rating is #{morningstar_rating}."
puts ""
puts "#{total_assets} in assets are held in the #{category} category and the fund's management charges a fee of #{expense_ratio} per year."


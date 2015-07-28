get '/:fund' do
  @fund = params[:fund]
  @other_fund = Fund.find_by(symbol: params[:fund])
  @user = User.find(session[:id])
  @baskets = @user.baskets
  @fund_url = ("http://www.finance.yahoo.com/q?s=" + @fund)
  @risk_url = ("http://finance.yahoo.com/q/rk?s=" + @fund + "+Risk")
  @doc = Nokogiri::HTML(open(@fund_url))
  @risk_doc = Nokogiri::HTML(open(@risk_url))

  @name = @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.rtq_div').css('.yui-g').css('.yfi_rt_quote_summary').css('h2').text
  @price = @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.rtq_div').css('.yui-g').css('.yfi_rt_quote_summary').css('.yfi_rt_quote_summary_rt_top.sigfig_promo_1').css('.time_rtq_ticker').text.to_f
  @morningstar_rating = @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_fund_basics').css('.bd').css('table').css('tr').css('td').css('.yfnc_tabledata1.yfi_morning_star_rating').to_s[73]

  @crunched = @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.first.yfi-start-content').css('.yfi_quote_summary').css('.rtq_table').css('table').css('tr').css('td:nth-child(2)').text
  @expanded = @crunched.split("")
  @ytd_return = @expanded[5..9].join("").to_f
  @div_yield = @expanded[-5..-1].join("").to_f
  @top_holdings = []
  @fund_basics = []
  @performance_and_risk_stage = []

  @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_fund_basics').css('.bd').css('table').css('td').each do |i|
    @fund_basics << i.text
  end

  @total_assets = @fund_basics[3]
  @category = @fund_basics[4]
  @expense_ratio = @fund_basics[5]

  @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_top_holdings').css('.bd').css('table').css('td').css('.name').each do |equity|
    @top_holdings << equity.text
  end

  @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_perf_risk').css('.bd').css('table').css('td').each do |i|
    @performance_and_risk_stage << i.text
  end

  @five_yr_return = @performance_and_risk_stage[3]
  @rank_in_category = @performance_and_risk_stage[5]
  @percent_rank_in_category = @performance_and_risk_stage[7]
  @morningstar_risk_rating = @performance_and_risk_stage[11]

  @description = @doc.css('body').css('div#yfi_doc').css('div#yfi_bd').css('div#yfi_investing_content').css('.yui-u.rr').css('div#yfi_business_summary').css('.bd').text[0..-10]

  stats = []
  risks = []

  @risk_doc.css('.yfnc_datamoddata1').each do |i|
    stats << i.text
  end

  @risk_doc.css('.yfnc_tabledata1').each do |i|
    risks << i.text
  end

  #Risk Overview
  @morningstar_risk_rating = stats[0]
  @num_yrs_up = stats[1]
  @num_yrs_down = stats[2]
  @best_one_yr_return = stats[3]
  @worst_one_yr_return = stats[4]

  #Risk Stats
  @three_yr_alpha = risks[1]
  @three_yr_alpha_cat = risks[2]
  @three_yr_beta = risks[4]
  @three_yr_beta_cat = risks[5]
  @three_yr_mean_annual_return = risks[7]
  @three_yr_mean_annual_return_cat = risks[8]
  @three_yr_r_squared = risks[10]
  @three_yr_r_squared_cat = risks[11]
  @three_yr_std_deviation = risks[13]
  @three_yr_std_deviation_cat = risks[14]
  @three_yr_sharpe_ratio = risks[16]
  @three_yr_sharpe_ratio_cat = risks[17]
  @three_yr_treynor_ratio = risks[19]
  @three_yr_treynor_ratio_cat = risks[20]

  @five_yr_alpha = risks[22]
  @five_yr_alpha_cat = risks[23]
  @five_yr_beta = risks[25]
  @five_yr_beta_cat = risks[26]
  @five_yr_mean_annual_return = risks[28]
  @five_yr_mean_annual_return_cat = risks[29]
  @five_yr_r_squared = risks[31]
  @five_yr_r_squared_cat = risks[32]
  @five_yr_std_deviation = risks[34]
  @five_yr_std_deviation_cat = risks[35]
  @five_yr_sharpe_ratio = risks[37]
  @five_yr_sharpe_ratio_cat = risks[38]
  @five_yr_treynor_ratio = risks[40]
  @five_yr_treynor_ratio_cat = risks[41]

  @ten_yr_alpha = risks[43]
  @ten_yr_alpha_cat = risks[44]
  @ten_yr_beta = risks[46]
  @ten_yr_beta_cat = risks[47]
  @ten_yr_mean_annual_return = risks[49]
  @ten_yr_mean_annual_return_cat = risks[50]
  @ten_yr_r_squared = risks[52]
  @ten_yr_r_squared_cat = risks[53]
  @ten_yr_std_deviation = risks[55]
  @ten_yr_std_deviation_cat = risks[56]
  @ten_yr_sharpe_ratio = risks[58]
  @ten_yr_sharpe_ratio_cat = risks[59]
  @ten_yr_treynor_ratio = risks[61]
  @ten_yr_treynor_ratio_cat = risks[62]


  @new_fund = Fund.create(morningstar_rating: "#{@morningstar_rating}", name: "#{@name}", symbol: "#{@name[-6..-2]}", category: "#{@category}", description: "#{@description}", price: "#{@price}", expense_ratio: "#{@expense_ratio}", div_yield: "#{@div_yield}", ytd_return: "#{@ytd_return}", five_yr_return: "#{@five_yr_return}", total_assets: "#{@total_assets}", rank_in_category: "#{@rank_in_category}", percent_rank_in_category: "#{@percent_rank_in_category}", morningstar_risk_rating: "#{@morningstar_risk_rating}",num_yrs_up: "#{@num_yrs_up}", num_yrs_down: "#{@num_yrs_down}", best_one_yr_return: "#{@best_one_yr_return}", worst_one_yr_return: "#{@worst_one_yr_return}", three_yr_alpha: "#{@three_yr_alpha}", three_yr_alpha_cat: "#{@three_yr_alpha_cat}", three_yr_beta: "#{@three_yr_beta}", three_yr_beta_cat: "#{@three_yr_beta_cat}", three_yr_mean_annual_return: "#{@three_yr_mean_annual_return}", three_yr_mean_annual_return_cat: "#{@three_yr_mean_annual_return_cat}", three_yr_r_squared: "#{@three_yr_r_squared}", three_yr_r_squared_cat: "#{@three_yr_r_squred_cat}", three_yr_std_deviation: "#{@three_yr_std_deviation}", three_yr_std_deviation_cat: "#{@three_yr_std_deviation_cat}", three_yr_sharpe_ratio: "#{@three_yr_sharpe_ratio}", three_yr_sharpe_ratio_cat: "#{@three_yr_sharpe_ratio_cat}", three_yr_treynor_ratio: "#{@three_yr_treynor_ratio}", three_yr_treynor_ratio_cat: "#{@three_yr_treynor_ratio_cat}", five_yr_alpha: "#{@five_yr_alpha}", five_yr_alpha_cat: "#{@five_yr_alpha_cat}", five_yr_beta: "#{@five_yr_beta}", five_yr_beta_cat: "#{@five_yr_beta_cat}", five_yr_mean_annual_return: "#{@five_yr_mean_annual_return}", five_yr_mean_annual_return_cat: "#{@five_yr_mean_annual_return_cat}", five_yr_r_squared: "#{@five_yr_r_squared}", five_yr_r_squared_cat: "#{@five_yr_r_squred_cat}", five_yr_std_deviation: "#{@five_yr_std_deviation}", five_yr_std_deviation_cat: "#{@five_yr_std_deviation_cat}", five_yr_sharpe_ratio: "#{@five_yr_sharpe_ratio}", five_yr_sharpe_ratio_cat: "#{@five_yr_sharpe_ratio_cat}", five_yr_treynor_ratio: "#{@five_yr_treynor_ratio}", five_yr_treynor_ratio_cat: "#{@five_yr_treynor_ratio_cat}", ten_yr_alpha: "#{@ten_yr_alpha}", ten_yr_alpha_cat: "#{@ten_yr_alpha_cat}", ten_yr_beta: "#{@ten_yr_beta}", ten_yr_beta_cat: "#{@ten_yr_beta_cat}", ten_yr_mean_annual_return: "#{@ten_yr_mean_annual_return}", ten_yr_mean_annual_return_cat: "#{@ten_yr_mean_annual_return_cat}", ten_yr_r_squared: "#{@ten_yr_r_squared}", ten_yr_r_squared_cat: "#{@ten_yr_r_squred_cat}", ten_yr_std_deviation: "#{@ten_yr_std_deviation}", ten_yr_std_deviation_cat: "#{@ten_yr_std_deviation_cat}", ten_yr_sharpe_ratio: "#{@ten_yr_sharpe_ratio}", ten_yr_sharpe_ratio_cat: "#{@ten_yr_sharpe_ratio_cat}", ten_yr_treynor_ratio: "#{@ten_yr_treynor_ratio}", ten_yr_treynor_ratio_cat: "#{@ten_yr_treynor_ratio_cat}")

  if request.xhr?
    (erb :'funds/summary', layout: false).to_json
  else
    erb :'funds/summary'
  end
end
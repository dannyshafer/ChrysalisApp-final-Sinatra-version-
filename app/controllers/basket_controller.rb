get '/users/:user_id/baskets' do
end

get '/users/:user_id/baskets/:id' do
  # whatever
  @basket = Basket.find_by_id(params[:id])
  @fundsbasket = FundsBasket.where(basket_id: @basket.id)
  @funds_in_fundsbasket = []
  @fund_names = []

  @basket_price = 0
  @basket_expense_ratio = 0
  @basket_div_yield = 0
  @basket_ytd_return = 0
  @basket_five_yr_return = 0
  @basket_best_one_yr_return = 0
  @basket_worst_one_yr_return = 0
  @basket_three_yr_alpha = 0
  @basket_three_yr_alpha_cat = 0
  @basket_three_yr_beta = 0
  @basket_three_yr_beta_cat = 0
  @basket_three_yr_sharpe_ratio = 0
  @basket_three_yr_sharpe_ratio_cat = 0
  @basket_three_yr_treynor_ratio = 0
  @basket_three_yr_treynor_ratio_cat = 0


  @fundsbasket.each do |i|
    @funds_in_fundsbasket << i.fund_id
  end
  @funds_in_fundsbasket.each do |i|
    @fund_names << Fund.find_by_id(i)

    @basket_price += Fund.find_by_id(i).price.to_f
    @basket_expense_ratio += Fund.find_by_id(i).expense_ratio.to_f
    @basket_div_yield += Fund.find_by_id(i).div_yield.to_f
    @basket_ytd_return += Fund.find_by_id(i).ytd_return.to_f
    @basket_five_yr_return += Fund.find_by_id(i).five_yr_return.to_f
    @basket_best_one_yr_return += Fund.find_by_id(i).best_one_yr_return.to_f
    @basket_worst_one_yr_return += Fund.find_by_id(i).worst_one_yr_return.to_f
    @basket_three_yr_alpha += Fund.find_by_id(i).three_yr_alpha.to_f
    @basket_three_yr_alpha_cat += Fund.find_by_id(i).three_yr_alpha_cat.to_f
    @basket_three_yr_beta += Fund.find_by_id(i).three_yr_beta.to_f
    @basket_three_yr_beta_cat += Fund.find_by_id(i).three_yr_beta_cat.to_f
    @basket_three_yr_sharpe_ratio += Fund.find_by_id(i).three_yr_sharpe_ratio.to_f
    @basket_three_yr_sharpe_ratio_cat += Fund.find_by_id(i).three_yr_sharpe_ratio_cat.to_f
    @basket_three_yr_treynor_ratio += Fund.find_by_id(i).three_yr_treynor_ratio.to_f
    @basket_three_yr_treynor_ratio_cat += Fund.find_by_id(i).three_yr_treynor_ratio_cat.to_f
  end

    @basket_price = @basket_price / @fund_names.length
    @basket_expense_ratio = @basket_expense_ratio / @fund_names.length
    @basket_div_yield = @basket_div_yield / @fund_names.length
    @basket_five_yr_return = @basket_five_yr_return / @fund_names.length
    @basket_ytd_return = @basket_ytd_return / @fund_names.length
    @basket_best_one_yr_return = @basket_best_one_yr_return / @fund_names.length
    @basket_worst_one_yr_return = @basket_worst_one_yr_return / @fund_names.length
    @basket_three_yr_alpha = @basket_three_yr_alpha / @fund_names.length
    @basket_three_yr_alpha_cat = @basket_three_yr_alpha_cat / @fund_names.length
    @basket_three_yr_beta = @basket_three_yr_beta / @fund_names.length
    @basket_three_yr_beta_cat = @basket_three_yr_beta_cat / @fund_names.length
    @basket_three_yr_sharpe_ratio = @basket_three_yr_sharpe_ratio / @fund_names.length
    @basket_three_yr_sharpe_ratio_cat = @basket_three_yr_sharpe_ratio_cat / @fund_names.length
    @basket_three_yr_treynor_ratio = @basket_three_yr_treynor_ratio / @fund_names.length
    @basket_three_yr_treynor_ratio_cat = @basket_three_yr_treynor_ratio_cat / @fund_names.length

  if request.xhr?
    erb :'baskets/basket_summary', layout: false
  else
    erb :'funds/summary'
  end
end

post '/users/:user_id/baskets' do
  @name = Basket.create(name: params[:basket_name], user_id: params[:user_id])
  redirect "/users/#{params[:user_id]}"
end

post '/users/:user_id/baskets/:basket_id/funds/:fund_id' do
  @current_basket = Basket.find_by(id: params[:basket_id])
  @current_fund = Fund.find_by(id: params[:fund_id])
  @fundsbasket = FundsBasket.new(fund_id: @current_fund.id, basket_id: @current_basket.id)
  if @fundsbasket.save
    redirect "/users/#{params[:user_id]}"
  else
    redirect '/'
  end
end


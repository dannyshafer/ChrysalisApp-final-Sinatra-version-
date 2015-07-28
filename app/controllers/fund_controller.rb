require 'nokogiri'
require 'open-uri'

post '/mutf_summary' do
  create_fund(params[:fund])

    erb :'funds/summary'
end

post '/ajax_mutf' do

  create_fund(params[:fund])

  erb :'funds/_fund', layout: false, :locals => {new_fund: @new_fund}

end

get '/:fund' do
  create_fund(params[:fund])

  if request.xhr?
    (erb :'funds/summary', layout: false).to_json
  else
    erb :'funds/summary'
  end
end

delete '/funds/:fund_id' do
  fund = Fund.find(params[:fund_id])
  fund.destroy

  if request.xhr?

  else
    redirect '/'
  end
end
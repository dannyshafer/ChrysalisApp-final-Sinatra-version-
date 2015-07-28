get '/:fund' do
  create_fund(params[:fund])

  if request.xhr?
    (erb :'funds/summary', layout: false).to_json
  else
    erb :'funds/summary'
  end
end
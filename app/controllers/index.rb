get '/' do
 erb :index
end

get '/all' do
  @all = Fund.all
  erb :all
end

get '/users/sign_up' do
  erb :sign_up
end

#Sign up
post '/sign_up' do
  @user = User.new(username: params[:username], password: params[:password])

  if @user.save
    session[:id] = @user.id
    redirect "users/#{@user.id}"
  else
    redirect '/'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/summary'
end

#Sign in
get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    # login successful
    session[:id] = @user.id
    redirect "users/#{@user.id}"
  else
    # login unsuccessful
    redirect '/'
  end
end

#Log out
delete '/sessions/destroy' do
  session[:id] = nil
  redirect '/'
end

post '/users' do
  @user = User.create(params[:user])
  erb :'users/dashboard'
end

get '/logout' do
  session[:id] = nil
  redirect '/'
end
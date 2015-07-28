# Login
get '/sessions/new' do

  erb :'sessions/new'
end

post '/sessions' do
  # @user = User.where(username: params[:username]).first
  @user = User.find_by_username(params[:username]) # More optimal
  if @user.login(params[:password])
    # login successful
    session[:user_id] = @user.id
    redirect '/user_dashboard' #make this view
  else
    # login unsuccessful
    redirect '/sessions/new'
  end

end

# Logout
delete '/sessions/destroy' do
  session[:user_id] = nil
  redirect '/'
end

# Signup (Create a user)
# These should normally go in the users controller file
get '/users/new' do

  erb :'users/new'
end

post '/users' do
  @user = User.create(params[:user])
  redirect '/user_dashboard' #make this view
end

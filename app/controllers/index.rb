# GET ===========================================================

#render home page
get '/' do
  @users = User.all.sort
  erb :index
end

get '/users' do
  @users = User.all.sort
  erb :users
end

get '/users/:id' do
  @current_user = User.find_by(id: params[:id])
  erb :profile
end

get '/mbarks' do
  @mbarks = Mbark.all
  erb :mbarks
end

get '/dogs' do
  @dogs  = Dog.all
  erb :dogs
end


# POST ===========================================================

# sign-in
post '/sessions' do
  @current_user = User.find_by(email: params[:email])
  if @current_user && @current_user.authenticate(params[:password])
    session[:user_id] = @current_user.id
    redirect '/mbarks'
  else
    redirect '/'
  end
end


# sign-up a new user
post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id]=user.id
  else
    redirect '/'
  end
  redirect "/users/#{user.id}"
end

# PUT ===========================================================








# DELETE ===========================================================


# sign-out -- invoked
delete '/sessions/:id' do
  session[:user_id]=nil
  redirect '/'
end



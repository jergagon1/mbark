# GET ===========================================================

#render home page
get '/' do
  erb :index
end

# render sign-in partial
# get '/sessions/new' do
#   erb :_sign_in
# end

# # render sign-up partial
# get '/users/new' do
#   erb :_sign_up
# end


# POST ===========================================================

# sign-in
post '/sessions' do
  @current_user = User.find_by(email: params[:email])
  p @current_user
  if @current_user && @current_user.authenticate(params[:password])
    session[:user_id] = @current_user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end


# sign-up a new user
post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id]=user.id
  else
    redirect '/users/new'
  end
  redirect '/'
end

# PUT ===========================================================








# DELETE ===========================================================


# sign-out -- invoked
delete '/sessions/:id' do
  session[:user_id]=nil
  redirect '/'
end



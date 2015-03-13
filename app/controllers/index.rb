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
  @user_events = current_user.events
  @all_events = Event.all
  @non_user_events = @all_events - @user_events
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

# create a new dog
post '/dogs/new' do
  dog = Dog.new(params[:dog])
  dog.user_id = session[:user_id]
  if dog.save
    redirect "/users/#{current_user.id}"
  end
end

post '/mbarks/new' do
  event = Event.new(params[:event])
  current_user.events << event
  if event.save
    redirect "/mbarks"
  end
end



# PUT ===========================================================

put '/mbarks/add_user/:id' do
  event_to_add = Event.find(params[:id])
  current_user.events << event_to_add

  content_type :json
  { event: event_to_add }.to_json
  # redirect "/mbarks"

  # event_partial = erb :event_partial, locals: { event: event }, layout: false
  # { partial: event_partial }.to_json
end






# DELETE ===========================================================


# sign-out -- invoked
delete '/sessions/:id' do
  session[:user_id]=nil
  redirect '/'
end



helpers do

  # return the current user if there is a user signed in.
  def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
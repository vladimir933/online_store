module LoginHelper

  def authenticate?(user)
    user.password == params[:user][:password]
  end

  def authorize(user)
    session[:user_id] = user.id
  end

end

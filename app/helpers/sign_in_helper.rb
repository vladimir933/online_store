module SignInHelper

  def authenticate?(user)
    user.password == params[:password]
  end

  def authenticate_api?(user, password)
    user.password == password
  end

end

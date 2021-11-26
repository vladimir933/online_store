module SignInHelper

  def authenticate?(user)
    user.password == params[:password]
  end

end

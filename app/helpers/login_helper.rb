module LoginHelper

  def authenticate?(user)
    user.password == params[:password]
  end

end

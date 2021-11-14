class Session::LoginController < Session::ApplicationController

  def index

  end

  def edit

  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if helpers.authenticate?(user)
      helpers.authorize(user)
      redirect_to market_index_path
    else
      redirect_to new_session_login_path
    end
  end

  def update

  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_login_path
  end

end

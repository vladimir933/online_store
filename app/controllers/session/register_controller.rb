class Session::RegisterController < Session::ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to session_login_index_path
    else
      redirect_to new_session_register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :birthday, :email, :role, :password, :password_confirmation, :registration_time)
  end

end

class Session::SignUpController < Session::ApplicationController
  include SignUpHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      create_cart(@user)
      redirect_to session_sign_in_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :birthday, :email, :role, :password, :password_confirmation, :registration_time)
  end

end

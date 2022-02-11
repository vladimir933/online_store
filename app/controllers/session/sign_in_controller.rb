class Session::SignInController < Session::ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user.present? && helpers.authenticate?(user)
      session[:user_id] = user.id
      redirect_to store_root_path
    else
      flash[:alert] = t('session.sign_in.invalid_sign_in')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to session_sign_in_path
  end

end

class Session::SignInController < Session::ApplicationController

  def index

  end

  def edit

  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user.present? && helpers.authenticate?(user)
      session[:user_id] = user.id
      redirect_to market_index_path
    else
      flash[:alert] = 'Invalid login or password'
      render :new
    end
  end

  def update

  end

  def destroy
    session.delete(:user_id)
    redirect_to session_sign_in_path
  end

end

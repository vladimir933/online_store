class ApplicationController < ActionController::Base
  before_action :authenticate
  authorize_resource class: false

  def authenticate
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def current_user
    @user
  end

end

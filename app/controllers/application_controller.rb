class ApplicationController < ActionController::Base
  before_action :authenticate
  # authorize_resource class: false
  around_action :switch_locale

  def authenticate
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def current_user
    @user
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    I18n.with_locale(params[:locale] || I18n.default_locale, &action)
  end

end

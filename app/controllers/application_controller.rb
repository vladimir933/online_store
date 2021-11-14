class ApplicationController < ActionController::Base
    before_action :authenticate

    def authenticate
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end

end

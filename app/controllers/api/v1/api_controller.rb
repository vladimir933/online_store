module Api
  module V1
    class ApiController < ActionController::Base
      before_action :check_basic_auth
      skip_before_action :verify_authenticity_token

      private

      def check_basic_auth
        user = User.find_by(email: params[:email])

        if user && helpers.authenticate?(user)
          @current_user = user
        else
          head :unauthorized
        end
      end

      def current_user
        @current_user
      end

    end
  end
end
module Api
  module V1
    class CommentsController < ApiController
      before_action :found_comment, only: %i[show update destroy]

      def index
        comments = current_user.comments.where(find_comment_params).sort
        render json: comments
      end

      def show
        render json: @comment
      end

      def create
        comment = current_user.comments.new(comment_params)
        if comment.save
          render json: comment
          head :gone
        else
          head :forbidden
        end
      end

      def update
        if current_user.comments.include?(@comment)
          @comment.update(comment_params)
          head :accepted
        else
          head :forbidden
        end
      end

      def destroy
        if current_user.comments.include?(@comment)
          @comment.destroy
          head :gone
        else
          head :forbidden
        end
      end

      private

      def comment_params
        params.permit(:item_id, :comment_time, :body)
      end

      def find_comment_params
        params.permit(:item_id, :comment_time)
      end

      def found_comment
        @comment = current_user.comments.find_by(id: params[:id])
      end

    end
  end
end
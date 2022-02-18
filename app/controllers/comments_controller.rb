class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    if comment.save
      redirect_to store_item_path(params[:item_id])
    else
      redirect_to root_path
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:comment_id])
    comment.destroy
    redirect_to store_item_path(params[:item_id])
  end

  private

  def comment_params
    params.permit(:user_id, :item_id, :comment_time, :body)
  end

end

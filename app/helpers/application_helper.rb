module ApplicationHelper
  
  def user_log_in?
    params[:user_id].present?
  end

end

class Market::ItemRateController < Market::ApplicationController

  def create
    @rating = ItemRate.new(item_rating_params)
    if @rating.save
      redirect_to market_item_path(params[:item_id])
    else
      redirect_to root_path
    end 
  end

  def destroy
  end

  private

  def item_rating_params
    {
      user_id: @user.id, 
      item_id: params[:item_id], 
      item_rating: params[:item_rating]
    }
  end

end
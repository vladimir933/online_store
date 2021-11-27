class MarketController < ApplicationController
  include MarketHelper

  before_action :find_order, only: %i[create destroy]

  def index
    @items = Item.all
  end
  
  # добавить товар в корзину пользователя
  def create
    unless @order.present?
      make_order
    else
      update_order(@order)
    end
  end

  # удалить товар с корзины пользователя
  def destroy
    if @order
      @order.destroy
    else
      redirect_to root_path
    end
  end

  private

  def find_order
    @order = Order.find_by(order_params)
  end

  def order_params
    {
      item_id: params[:id],
      cart_id: @user.cart.id
    }
  end

end

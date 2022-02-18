class OrderController < ApplicationController
  include OrderHelper

  before_action :find_order, only: %i[create destroy]
  
  # add item to cart
  def create
    unless @order.present?
      make_order
    else
      update_order(@order)
    end
  end

  # delete item from the cart
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

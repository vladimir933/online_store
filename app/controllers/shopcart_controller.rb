class ShopcartController < ApplicationController

  def index
    @cart_orders = @user.cart.orders
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to shopcart_index_path
  end

end

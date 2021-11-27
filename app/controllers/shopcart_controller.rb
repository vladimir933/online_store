class ShopcartController < ApplicationController

  def index
    @orders = @user.cart.orders
  end

end

module MarketHelper

  def make_order
    Order.create(item_id: params[:id], cart_id: @user.cart.id)
  end

  def update_order(order)
    order.update(quantity: order.quantity.next)
  end

end

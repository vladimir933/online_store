module Api
  module V1
    class OrdersController < ApiController
      before_action :find_orders, only: [:index, :show]

      def index
        orders = @orders.where(find_order_params).sort
        render json: orders
      end

      def show
        order = @orders.find_by(id: params[:id])
        render json: order
      end

      def destroy
        orders = current_user.cart.orders
        found_order = orders.find_by(id: params[:id])
        if orders.include?(found_order)
          found_order.destroy
          head :gone
        else
          head :forbidden
        end
      end

      private

      def find_orders
        @orders = current_user.cart.orders.joins(:item).select(:id, :item_id, :cart_id, :quantity, :name, :kind, :description, :price, :delivery_time)
      end

      def find_order_params
        params.permit(:item_id, :quantity)
      end

    end
  end
end

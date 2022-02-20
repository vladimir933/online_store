module Api
  module V1
    class ItemsController < ApiController
      skip_before_action :check_basic_auth, only: %i[index show]
      before_action :found_item, only: %i[show update destroy]

      def index
        items = Item.all.where(find_item_params).sort
        render json: items
      end

      def show
        render json: @item
      end

      def create
        current_user.items.create(create_item_params)
      end

      def update
        if current_user.items.include?(@item)
          @item.update(item_params)
        else
          head :forbidden
        end
      end

      def destroy
        if current_user.items.include?(@item)
          @item.destroy
        else
          head :forbidden
        end
      end

      private

      def create_item_params
        params.permit(:name, :kind, :description, :price, :delivery_time)
      end

      def find_item_params
        params.permit(:name, :kind, :description, :user_id, :price, :delivery_time)
      end

      def found_item
        @item = Item.find_by(id: params[:id])
      end

    end
  end
end

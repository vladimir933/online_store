class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer    :user_id
      t.integer    :item_id
      t.integer    :cart_id
      t.integer    :quantity, default: 0
    end
  end
end

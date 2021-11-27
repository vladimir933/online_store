class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer    :item_id
      t.integer    :cart_id
      t.integer    :quantity, default: 1
    end
  end
end

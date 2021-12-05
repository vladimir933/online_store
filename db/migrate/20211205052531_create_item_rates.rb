class CreateItemRates < ActiveRecord::Migration[6.1]
  def change
    create_table :item_rates do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :item_rating
    end
  end
end

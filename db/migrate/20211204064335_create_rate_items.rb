class CreateRateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :rate_items do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :item_rating
    end
  end
end
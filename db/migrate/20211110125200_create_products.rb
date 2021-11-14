class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string      :name
      t.string      :kind
      t.text        :description
      t.integer     :seller_id
      t.integer     :price
      t.integer     :rating, default: 0
      t.integer     :delivery_time, default: 30
    end
  end
end
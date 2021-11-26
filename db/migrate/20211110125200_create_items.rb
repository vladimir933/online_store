class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string     :name
      t.string     :kind
      t.text       :description
      t.integer    :seller_id
      t.float      :price
      t.float      :rating, default: 0
      t.integer    :delivery_time
    end
  end
end
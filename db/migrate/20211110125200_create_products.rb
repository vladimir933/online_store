class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string     :name
      t.string     :type
      t.text       :description
      t.integer    :price
      t.integer    :rating
      t.string     :delivery_time
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string     :name
      t.integer    :user_id
      t.string     :kind
      t.text       :description
      t.float      :price
      t.integer    :delivery_time
    end
  end
end
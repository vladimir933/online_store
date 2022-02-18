class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :item_id
      t.integer :user_id
      t.string  :comment_time
      t.text    :body
    end
  end
end

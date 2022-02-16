class Item < ApplicationRecord

  has_one_attached :avatar

  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :carts, through: :orders
  has_many :item_rates, dependent: :destroy

  validates :name, length: { in: 2..50, message: :name }
  validates :kind, presence: { message: :kind }
  validates :delivery_time, presence: { message: :delivery_time }
  validates :description, length: { in: 5..200, message: :description }
  validates :price, length: { in: 0..999_999_999, message: :price }

end

class Item < ApplicationRecord

    has_one_attached :avatar

    belongs_to :user
    has_many :orders, dependent: :destroy
    has_many :carts, through: :orders
    has_many :item_rates, dependent: :destroy

    validates :name, length: { in: 2..50, message: 'Недопустимое количество символов в названии товара' }
    validates :kind, presence: { message: 'Не указана категория товара' }
    validates :delivery_time, presence: { message: 'Неверное время доставки товара' }
    validates :description, length: { in: 5..200, message: 'Недопустимое описание товара, количество символов 5..200' }
    validates :price, length: { in: 0..999_999_999, message: 'Недопустимая цена товара' }

end

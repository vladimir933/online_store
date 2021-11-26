class Item < ApplicationRecord

    has_one_attached :avatar

    has_many :orders
    has_many :carts, through: :orders

    validates :name, length: { in: 2..50, message: 'Недопустимое количество символов в названии товара' }
    validates :kind, presence: { message: 'Не указана категория товара' }
    validates :delivery_time, presence: { message: 'Неверное время доставки товара' }
    validates :description, length: { in: 5..200, message: 'Слишком маленькое описание товара' }
    validates :price, length: { in: 0..999_999_999, message: 'Недопустимая цена товара' }

end

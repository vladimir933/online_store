class Item < ApplicationRecord

    has_one_attached :avatar

    belongs_to :user
    has_many :orders, dependent: :destroy
    has_many :carts, through: :orders
    has_many :rate_items, dependent: :destroy

    validates :name, length: { in: 2..50, message: 'Недопустимое количество символов в названии товара' }
    validates :kind, presence: { message: 'Не указана категория товара' }
    validates :delivery_time, presence: { message: 'Неверное время доставки товара' }
    validates :description, length: { in: 5..200, message: 'Слишком маленькое описание товара' }
    validates :price, length: { in: 0..999_999_999, message: 'Недопустимая цена товара' }
    
    RATING = %i[1 2 3 4 5]

end

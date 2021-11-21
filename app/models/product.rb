class Product < ApplicationRecord

    has_one_attached :avatar

    validates :name, length: { in: 2..50 }
    validates :kind, :delivery_time, presence: true
    validates :description, length: { in: 5..200 }
    validates :price, length: { in: 0..999_999_999 }

end

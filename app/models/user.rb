class User < ApplicationRecord
    
    attr_accessor :password_confirmation
    
    has_one :cart, dependent: :destroy
    has_many :items, dependent: :destroy
    has_many :item_rates, dependent: :destroy
    
    validates :name, length: { in: 2..30, message: :name }
    validates :surname, length: { in: 2..50, message: :surname }
    validates :role, presence: { message: :role }
    validates :birthday, presence: true, presence: { message: :birthday }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: :format }, uniqueness: { message: :uniq }
    validates :password, length: { in: 5..30, message: :symbols }, confirmation: { message: :confirmation }

end

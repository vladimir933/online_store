class User < ApplicationRecord
    attr_accessor :password_confirmation
    
    validates :name, :surname, :role, :birthday, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :password, length: { in: 5..15 }, confirmation: true

end

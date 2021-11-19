class User < ApplicationRecord
    attr_accessor :password_confirmation
    
    validates :name, :surname, :role, :birthday, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :password, length: { minimum: 5, maximum: 15 }, confirmation: true
end

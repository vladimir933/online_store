class User < ApplicationRecord
    attr_accessor :password_confirmation

    has_many :orders
    has_many :products, through: :orders
    
    validates :name, length: { in: 2..30, message: 'Недопустимое имя' }
    validates :surname, length: { in: 2..50, message: 'Недопустимая фамилия' }
    validates :role, presence: {message: 'Отметьте свою роль'}
    validates :birthday, presence: true, presence: { message: 'Введите дату рождения' }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Неверный формат почты' }, uniqueness: { message: 'Почта уже зарегистрирована в системе' }
    validates :password, length: { in: 5..30, message: 'Количество символов пароля не меньше 5' }, confirmation: { message: 'Пароли не совпадают' }

end

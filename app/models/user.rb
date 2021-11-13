class User < ApplicationRecord
    validates_confirmation_of :password
end

class User < ApplicationRecord
    validates :nombre, presence: true
    validates :email, presence: true
    validates :tel, presence: true
end

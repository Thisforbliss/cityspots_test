class Seller < ApplicationRecord
    has_secure_password 
    has_many :houses
    has_many :buyers, through: :houses
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
    #attr_accessor :password, :password_confirmation
end

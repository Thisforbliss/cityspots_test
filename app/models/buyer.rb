class Buyer < ApplicationRecord
    #has_secure_password error: cannot load such file -- bcrypt
    has_many :houses
    has_many :sellers, through: :houses
    validates :first_name, presence: true
    validates :last_name, presence: true
     #format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :phone_number, presence: true
    validates :phone_number, uniqueness: true
    attr_accessor :password, :password_confirmation
end

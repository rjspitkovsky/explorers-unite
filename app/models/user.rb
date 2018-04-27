class User < ApplicationRecord
  has_secure_password
  has_many :trips
  has_many :countries, through: :trips
  validates :name, presence: true
  validates :favorite_country, presence: true
  validates :password, length: {minimum: 6}
  validates :email, uniqueness: true 
end

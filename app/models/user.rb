class User < ApplicationRecord
  has_secure_password
  has_many :trips
  has_many :countries, through: :trips
  validates :name, presence: true 
end

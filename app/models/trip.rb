class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  validates :comment, length: {maximum: 100}
  validates :recommend?, presence: true
  validates :year, length: {is: 4}
end

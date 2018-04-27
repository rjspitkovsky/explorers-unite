class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  validates :comment, length: {maximum: 100}
  validates :year, length: {is: 4}

    def country_name=(name)
      self.country = Country.find_or_create_by(name: name)
    end

    def country_name
      self.country.name if self.country
    end
end

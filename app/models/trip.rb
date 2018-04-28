class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  validates :comment, length: {maximum: 100}
  validates :year, length: {is: 4}
  validate :future_trip?

    def future_trip?
      if year > Time.new.year
        errors.add(:year, "cannot be in the future.")
      end
    end

    def country_name=(name)
      self.country = Country.find_or_create_by(name: name)
    end

    def country_name
      self.country.name if self.country
    end

    def self.twentieth_century
      where('year <= ?', 2000)
    end

    def self.aughts
      where('year > ? AND year < ?', 1999, 2010)
    end

    def self.first_half_of_teens
      where('year > ? AND year < ?', 2009, 2016)
    end

    def self.second_half_of_teens
      where('year > ? AND year < ?', 2015, 2019)
    end
end

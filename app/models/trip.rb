class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :country
  # before_save :recommended?
  #
  # def recommended?
  #   if trip.recommend?
  #     trip.recommend? = "Yes"
  #     trip.update
  #   else
  #     trip.recommend? = "No"
  #     trip.update
  #   end
  # end
end

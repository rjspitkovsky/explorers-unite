module TripsHelper

  def recommended?(trip)
      if trip.recommend?
        "Recommended? Yes"
      else
        "Recommended? No"
      end
  end
end

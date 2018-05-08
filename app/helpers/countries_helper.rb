module CountriesHelper

  def tripless(country)
      country.trips.empty?
  end
end

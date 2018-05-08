module CountriesHelper

  def tripless?(country)
      if country.trips.empty?
        country.delete
      end
    
  end
end

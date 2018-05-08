module ApplicationHelper

  def tripless(user)
    user.trips.empty?
  end 
end

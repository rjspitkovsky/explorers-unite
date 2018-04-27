class TripsController < ApplicationController

  def new
    @trip = Trip.new(user_id: params[:user_id])
  end

  def create
    Trip.create(trip_params)
  end

  private

  def trip_params
    params.require(:trip).permit(:country_name, :comment, :recommend?, :year)
  end
end

require 'pry'
class TripsController < ApplicationController
  before_action :require_login

  def index
    if !params[:year].blank?
      class_method_conditional
      @filter = params[:year]
      else
        @trips = Trip.all
      end
    end

  def new
     if params[:user_id] && !User.exists?(params[:user_id])
       redirect_to users_path
    else
      @trip = Trip.new(user_id: params[:user_id])
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
      if params[:trip][:country] != ""
        @trip.country = Country.find_by(name: params[:trip][:country])
        saving_trip
      else
        saving_trip
      end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
    if @trip.user != current_user
      redirect_to users_path
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if @trip.update(trip_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @trip = @user.trips.find_by(id: params[:id])
      if @trip.nil?
        redirect_to users_path
      end
    else
    @trip = Trip.find_by(id: params[:id])
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.delete
    redirect_to user_path(current_user)
  end

  private

  def trip_params
    params.require(:trip).permit(:country_name, :comment, :recommend, :year)
  end

  def class_method_conditional
    if params[:year] == "pre-2000"
      @trips = Trip.twentieth_century
    elsif
      params[:year] == "2000-2009"
      @trips = Trip.aughts
    elsif
      params[:year] == "2010-2015"
      @trips = Trip.first_half_of_teens
    elsif
      params[:year] == "2016-present"
      @trips = Trip.second_half_of_teens
    end
  end

  def saving_trip
    if  @trip.save
      redirect_to users_path
    else
      render 'new'
    end
  end

end

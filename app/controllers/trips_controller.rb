class TripsController < ApplicationController
  before_action :require_login

  def index
    if !params[:year].blank?
      # if params[:year] == "pre-2000"
      #   @trips = Trip.twentieth_century
      # elsif
      #   params[:year] == "2000-2009"
      #   @trips = Trip.aughts
      # elsif
      #   params[:year] == "2010-2015"
      #   @trips = Trip.first_half_of_teens
      # elsif
      #   params[:year] == "2016-present"
      #   @trips = Trip.second_half_of_teens
      class_method_conditional
      @filter = params[:year]
      else
        @trips = Trip.all
      end
    end
  #end

  def new
     if params[:user_id]
    @trip = Trip.new(user_id: params[:user_id])
    else
      @trip = Trip.new(user_id: current_user.id)
    end
  end

  def create
    @country = Country.find_or_create_by(name: params[:trip][:country_name])
    @trip = Trip.new(user_id: current_user.id, country_id: @country.id, comment: params[:trip][:comment], recommend?: params[:trip][:recommend], year: params[:trip][:year])
    if @trip.save
    redirect_to users_path
  else
    render 'new'
  end
end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update

    @trip = Trip.find_by(id: params[:id])
    @trip.comment = params[:trip][:comment]

    if @trip.update(trip_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.delete
    redirect_to user_path(current_user)
  end

  private

  def trip_params
    params.require(:trip).permit(:country_name, :comment, :recommend?, :year)
  end
end

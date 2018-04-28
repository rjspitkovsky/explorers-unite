class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :class_method_conditional

  private

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to root_path unless session.include?(:user_id)
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


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

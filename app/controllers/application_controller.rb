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

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new]


  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
end

  def new
    @user = User.new
  end


end

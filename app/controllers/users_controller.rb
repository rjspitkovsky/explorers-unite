require 'pry'
class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]


  def index
    @users = User.all
    @user = User.most_trips_taken.first
  end

  def show
    if params[:id] == "most_trips_taken"
      @user = User.most_trips_taken.first
      render 'most_trips_taken'

    else
    @user = User.find_by(id: params[:id])
  end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


private
  def user_params
    params.require(:user).permit(:name, :email, :password, :favorite_country)
  end

end

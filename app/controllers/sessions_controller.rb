class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user_id
        redirect_to user_path(@user)
      else
        redirect_to '/login'
      end
    end
  end

  def destroy
  end

end

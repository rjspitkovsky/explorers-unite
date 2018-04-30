require 'pry'
class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env['omniauth.auth']

      @user = User.find_or_create_by_omniauth(auth_hash) #do |u|
      #   u.name = auth_hash['info']['name']
      #   u.email = auth_hash['info']['email']
      #   u.image = auth_hash['info']['image']
      # end
       #binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else

      if @user = User.find_by(email: params[:email])

          if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            flash[:notice] = "Invalid e-mail or password."
            redirect_to '/login'
          end

      else
        flash[:notice] = "We cannot find an account with that e-mail."
        redirect_to '/login'
      end

  end
end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end

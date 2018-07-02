require 'pry'
class SessionsController < ApplicationController

  def new
  end

  def create
    # First we check if user is trying to login through third party authentication (Facebook)
    if auth_hash = request.env['omniauth.auth']
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # Then we check if the email provided matches with an email in the database
      if @user = User.find_by(email: params[:email])
        # Then we check if the password given matches the password after its been salted when the account was created
          if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            # If the password is wrong
            flash[:notice] = "Invalid e-mail or password."
            redirect_to '/login'
          end
          # If the email is wrong 
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

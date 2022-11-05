class SessionsController < ApplicationController
  def new
  end
  
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      #login
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in!" 
    else 
      redirect_to login_path, alert: "Invalid email or password"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
  
end

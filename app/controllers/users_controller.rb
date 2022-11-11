class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_user, except: [:new, :create]
  
  
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.valid? 
    else 
      @user = User.new
    end
    
  end
  
  def create
    @user = User.new user_params
    if @user.save
      login(@user)
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  
  def show
  end
  
  def edit
  end
  
  def update
    if @user.update user_params 
      redirect_to @user, notice: "Profile updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  
  def destroy
    logout
    @user.destroy
    redirect_to logout_path, alert: "Account Deleted"
    
  end
  
  
  
  
  private
  
  
  def load_user
    @user = User.find params[:id]
  end
  
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  
end

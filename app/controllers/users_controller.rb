class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_user
  
  
  
  def new
    @user = User.new
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
  
  
  private
  
  
  def load_user
    @user = User.find params[:id]
  end
  
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  
end

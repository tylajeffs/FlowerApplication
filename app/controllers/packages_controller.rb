class PackagesController < ApplicationController
  
  before_action :load_package, except: [:new, :index, :create] 
  
  def index
    
    @packages = Package.all
    
  end
  
  def new 
    @package = Package.new
  end
  
  def create
    @package = Package.new package_params
    if @package.save
      redirect_to packages_path, notice: "package created"
    else
      #validation errors
      render :new, status: :unprocessable_entity
    end

  end
  
  
  def show
  end
  
  def edit
  end
  
  
  def update
    if @package.update package_params 
      redirect_to @package, notice: "Package was updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  
  def destroy
    @package.destroy
    redirect_to packages_path, alert: "Package was deleted"
  end
  
  
  
  
  private
  
  def load_package
    @package = Package.find params[:id]
  end
  
  def package_params
    params.require(:package).permit(:name,:description,:price)
  end
  
  
  
end

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
  
  
  
  
  
  
  
  
  private
  
  def load_package
    @package = Package.find params[:id]
  end
  
  def package_params
    params.require(:package).permit(:name,:description,:price)
  end
  
  
  
end

class PackagesController < ApplicationController
  
  before_action :load_package, except: [:new, :index, :create] 
  
  #GET /packages
  def index
    @q = Package.ransack(params[:q])
    #@packages = Package.all
    @packages = @q.result
  end
  
  
  #GET /packages/new
  def new 
    @package = Package.new
  end
  
  
  #POST /packages
  def create
    @package = Package.new package_params
    if @package.save
      redirect_to packages_path, notice: "package created"
    else
      #validation errors
      render :new, status: :unprocessable_entity
    end
  end
  
  
  #GET /packages/:id
  def show
  end
  
  #GET /packages/:id/edit
  def edit
  end
  
  #PATCH/PUT /packages/:id
  def update
    if @package.update package_params 
      redirect_to @package, notice: "Package was updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  
  #DELETE /packages/:id
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

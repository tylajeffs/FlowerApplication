class PackagesController < ApplicationController
  def index
    
    @packages = Package.all
    
  end
  
  def new 
    @package = Package.new
  end
end

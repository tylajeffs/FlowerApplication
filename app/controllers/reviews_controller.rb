class ReviewsController < ApplicationController
  before_action :load_package
  
  def index
  end
  
  
  
  
  private
  
  
  def load_package
    @package = Package.find params[:package_id]
  end
  
end

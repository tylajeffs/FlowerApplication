class ReviewsController < ApplicationController
  before_action :authenticate, except: [:index,:show]
  before_action :load_package
  before_action :load_review, except: [:index,:new,:create]
  
  def index
  end
  
  
  def new 
    @review = Review.new
  end
  
  def create
    @review = Review.new review_params
    @review.user_id = current_user.id
    if @package.reviews << @review
      redirect_to package_review_path(@package,@review), notice: "Review Created"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  
  def show
  end
  
  def edit 
  end
  
  def update 
    
    if @review.update review_params
      redirect_to package_review_path(@package,@review), notice: "Review updated"
    else
      render :edit, status: :unprocessable_entity
    end
    
  end
  
  
  def destroy
    
    @review.destroy
    redirect_to package_reviews_path(@package), alert: "Review Deleted"
    
  end
  
  
  
  
  
  
  private
  
  def review_params
    params.require(:review).permit(:title, :stars, :body)
  end
  
  
  def load_review
    @review = @package.reviews.find params[:id]
  end
  
  
  def load_package
    @package = Package.find params[:package_id]
  end
  
end

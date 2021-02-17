class ReviewsController < ApplicationController
  before_action :set_restaurant, except: [ :destroy ]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # Thanks to belongs_to, we can do @review.restaurant
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  # Strong Params!
  def review_params
    params.require(:review).permit(:content)
  end
end

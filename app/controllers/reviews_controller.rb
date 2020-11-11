class ReviewsController < ApplicationController

  def new
    set_up
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    set_up
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end


private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_up
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end


class ReviewsController < ApplicationController
  def create
    @kitchen = Kitchen.find(params[:kitchen_id])
    @review = Review.new
    @review.kitchen = @kitchen
    return redirect_to @kitchen if @review.save

    render :new
  end
end

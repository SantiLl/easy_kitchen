class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment = @appointment
    authorize @review

    return redirect_to @appointment.kitchen if @review.save

    render :new
  end

  private

  def review_params
    params.require(:review).permit(:content, :raiting)
  end
end

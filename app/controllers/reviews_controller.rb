class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment = @appointment
    @kitchen = Appointment.find(params[:kitchen_id])
    authorize @review

    return redirect_to @kitchen if @review.save

    render :new
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

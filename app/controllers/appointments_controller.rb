class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  def show
    @review = Review.new
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @kitchen = Kitchen.find(params[:kitchen_id])
    @appointment.kitchen = @kitchen
    authorize @appointment
    return redirect_to @appointment if @appointment.save

    render :new
  end

  def edit
  end

  def update
    return redirect_to @appointment if @appointment.save

    render :new
  end

  def destroy
    @appointment.destroy
    redirect_to dashboard_path
  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end

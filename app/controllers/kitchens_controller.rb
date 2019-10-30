class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @kitchens = policy_scope(Kitchen).order(created_at: :desc)

    @kitchens = Kitchen.geocoded # returns flats with coordinates
    @markers = @kitchens.map do |kitchen|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: kitchen })
      }
    end
  end

  def show
    @appointment = Appointment.new
  end

  def new
    @kitchen = Kitchen.new
    authorize @kitchen
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.user = current_user
    authorize @kitchen
    return redirect_to @kitchen if @kitchen.save

    render :new
  end

  def edit
  end

  def update
    return redirect_to @kitchen if @kitchen.update(kitchen_params)

    render :edit
  end

  def destroy
    @kitchen.destroy
    redirect_to root_path
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
    authorize @kitchen
  end

  def kitchen_params
    params.require(:kitchen).permit(:address, :description)
  end
end

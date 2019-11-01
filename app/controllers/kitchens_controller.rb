class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  def index
    @kitchens = if params[:query].present?
                  Kitchen.search(params[:query])
                else
                  Kitchen.order(created_at: :desc).limit(6)
                end

    @kitchens = @kitchens # returns flats with coordinates
    @markers = @kitchens.map do |kitchen|
      {
        lat: kitchen.latitude,
        lng: kitchen.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: kitchen }),
        price: kitchen.price
      }
    end
    policy_scope(Kitchen)
  end

  def show
    @appointment = Appointment.new
    @disable_dates = []
    @kitchen.appointments.each do |appointment|
      @disable_dates << appointment.date
    end
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
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
    authorize @kitchen
  end

  def kitchen_params
    params.require(:kitchen).permit(:address, :description, :photo, :name, :price)
  end
end

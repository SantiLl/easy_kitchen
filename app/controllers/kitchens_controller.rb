class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  def index
    @kitchens = Kitchen.all
  end

  def show
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    return redirect_to @kitchen if @kitchen.save

    render :new
  end

  def edit
  end

  def update
    return redirect_to @kitchen if @kitchen.update

    render :edit
  end

  def destroy
    @kitchen.destroy
    redirect_to kitchens_path
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:address, :description)
  end
end
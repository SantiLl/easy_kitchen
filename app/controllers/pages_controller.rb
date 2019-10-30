class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    @kitchens = Kitchen.all.where(user: current_user)
    @appointments = Appointment.all.where(user: current_user)
  end
end

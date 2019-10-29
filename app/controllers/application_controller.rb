class ApplicationController < ActionController::Base
  # Obligar login en lugares que no sean las pags que estan en only
  # skip_before_action :authenticate_user!, only: [:home, :show]
  # Agregar First name and Last name en registration.
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def home
  end

  def show
  end
end

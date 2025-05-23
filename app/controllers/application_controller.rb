class ApplicationController < ActionController::Base
  before_action :configere_permitted_parameters, if: :devise_controller?
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def configere_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
  end
end

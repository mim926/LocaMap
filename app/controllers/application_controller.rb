class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email, :prefecture_id, :local_history, :icon_image ])
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :email ])
  end
end

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(resource)
    flash[:alert] = "Hello, #{current_user.first_name}!"
    resource.admin? ? admin_tests_path : root_path
  end


end

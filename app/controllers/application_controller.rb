class ApplicationController < ActionController::Base
  # File Edited on 07/13/2020 by Yifan Yao: Device initialized, users are required to get authenticated in advance
  before_action :authenticate_user!
  # File Edited on 07/23/2020 by Kevin Dong: layout
  layout 'application'
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end

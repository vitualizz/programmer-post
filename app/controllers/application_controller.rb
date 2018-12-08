class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:username, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :email, :password, :current_password]) 
  end

  private

  def set_locale
    I18n.locale = "es"
  end
end

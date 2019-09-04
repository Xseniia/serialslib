# frozen_string_literal: true

class ApplicationController < ActionController::Base # :nodoc:
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :gender, :date_of_birth, :email, :password, :country_id) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :gender, :date_of_birth, :name, :email, :password, :current_password, :country_id, :avatar) }
  end
end

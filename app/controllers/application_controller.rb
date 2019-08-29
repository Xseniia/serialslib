# frozen_string_literal: true

class ApplicationController < ActionController::Base # :nodoc:
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  def user_id
    session[:user_id] ||= nil
  end

  def get_current_user
    @current_user = User.find_by_id(user_id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :gender, :date_of_birth, :email, :password, :country_id) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :gender, :date_of_birth, :name, :email, :password, :current_password, :country_id, :avatar) }
  end
end

# frozen_string_literal: true

class User::SessionsController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :get_current_user

  def index
    if @current_user == nil
      render json: {
        message: 'user session not found'
      }, status: :not_found
    else
      render json: {
        currentUser: @current_user
      }, status: 200
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /user/sessions
  def create
    user = User.find_by_email(params[:email])

    if user&.valid_password?(params[:password])
      session[:user_id] = user.id
      render json: user.as_json, status: :created
    else
      head(:unauthorized)
    end
  end

  # DELETE /user/session
  def destroy
    session.delete(:user_id)
    render json: {
      session: session[:user_id],
      status: :deleted,
      notice: 'sessions destroyed'
    }
  end

  # protected

  def user_id
    session[:user_id]
  end

  def get_current_user
    @current_user = User.find_by_id(user_id)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

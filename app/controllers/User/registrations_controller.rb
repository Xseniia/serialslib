# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /users
  def create
    if params[:password] == params[:password_confirmation]
      user = User.new(
                        email: params[:email],
                        password: params[:password],
                        first_name: params[:first_name],
                        last_name: params[:last_name],
                        date_of_birth: params[:date_of_birth],
                        gender: params[:gender],
                        country_id: params[:country_id]
                      )

      if user.save
        session[:user_id] = user.id
        render json: {
          message: 'created',
          user_id: user.id
        }, status: :ok
      else
        render json: {
          message: 'error',
          err: user.errors.full_messages
        }, status: 406
      end
    else
      render json: {
        message: 'user can\'t be created',
        err: 'incorrect password confirmation'
      }, status: 406
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

# frozen_string_literal: true

class User::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    user = User.find_by_id(params[:id])

    if !user.valid_password?(params[:password])
      return render json: {
        message: 'Incorrect current password.'
      }, status: 400
    end

    if params[:new_password].present?
      if params[:new_password] == params[:new_password_confirmation]
        if user.update(
          password: params[:new_password]
        )
          render json: {
            message: 'Password changed successfully.'
          }, status: 200

          user.send_password_change_notification
        else
          render json: {
            message: 'Something went wrong.'
          }, status: 400
        end
      else
        render json: {
          message: 'Incorrect password confirmation.'
        }, status: 400
      end
    else
      return render json: {
        message: 'New password can\'t be empty.'
      }, status: 400
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end

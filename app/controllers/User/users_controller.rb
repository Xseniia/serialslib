# frozen_string_literal: true

class User::UsersController < ApplicationController # :nodoc:
  # before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy fetch_user_serials]

  # GET /users
  # GET /users.json
  def index
    @users = params[:need] == 'adm' ? User.admins : User.all
    render json: {
      users: @users
    }
  end

  # GET /users/1
  # GET /users/1.json
  def show
    country = @user.country_id.present? ? Country.find_by_id(@user.country_id).country_name : nil
    favourites = @user.serials_fav.records

    render json: {
      user: @user,
      country: country,
      favourites: favourites
    }
  end

  def fetch_user_serials
    serials = @user.user_serials(params[:status])

    render json: {
      status: params[:status],
      serials: serials
    }
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user = User.find_by_id(params[:id])
    emailChanged = user.email != params[:email] ? true : false

    if user.update(
                    email: params[:email],
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    date_of_birth: params[:date_of_birth],
                    gender: params[:gender],
                    country_id: params[:country_id]
                  )
      render json: {
        message: 'User was successfully updated.',
        user: user
      }
      if emailChanged
        user.send_email_changed_notification
        user.send_confirmation_instructions
      end
    else
      render json: {
        message: 'something went wrong.'
      }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy!
    render json: {
      message: 'user destroyed'
    }, status: 200
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :date_of_birth, :country_id, :avatar)
  end
end

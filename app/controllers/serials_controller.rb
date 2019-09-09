# frozen_string_literal: true

class SerialsController < ApplicationController # :nodoc:
  before_action :set_serial, only: %i[show edit update destroy add_view_status]
  before_action :set_view_status, only: %i[add_view_status]

  # GET /serials
  # GET /serials.json
  def index
    if params[:tag].present?
      @serials = Serial.tagged_with(params[:tag])
    elsif params[:query].present?
      @serials = Serial.search(params[:query]).records
    elsif params[:genre].present?
      @serials = Serial.with_genre_filter(params[:genre])
    else
      @serials = Serial.all
    end
    render json: { items: @serials }
  end

  # GET /serials/1
  # GET /serials/1.json
  def show
    is_fav = @serial.users_fav.where(id: params[:user_id]).present?
    view_status = null ||= ViewStatus.find_by(serial_id: @serial.id, user_id: params[:user_id])

    render json: {
      serial: @serial,
      seasons: @serial.seasons,
      tags: @serial.tags,
      genres: @serial.genres,
      actors: @serial.actors,
      isFav: is_fav,
      overall_rating: @serial.filled_stars,
      user_rating: @serial.current_user_stars(params[:user_id]),
      view_status: view_status
    }
  end

  # GET /serials/new
  def new
    @serial = Serial.new
  end

  # GET /serials/1/edit
  def edit; end

  # POST /serials
  # POST /serials.json
  def create
    @serial = Serial.new(serial_params)

    respond_to do |format|
      if @serial.save
        format.html { redirect_to @serial, notice: 'Serial was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # add serial view status
  def add_view_status
    @serial.users_status.destroy(User.find_by_id(params[:user_id])) unless @status.nil?

    if params[:view_status].empty?
      render json: { message: 'err' }
    else
      @new_status = ViewStatus.new(serial_id: @serial.id, user_id: params[:user_id], status: params[:view_status])
      if @new_status.save
        render json: {
          message: 'view status changed'
        }, status: 200
      else
        render json: {
          message: 'err'
        }, status: 400
      end
    end
  end

  # PATCH/PUT /serials/1
  # PATCH/PUT /serials/1.json
  def update
    respond_to do |format|
      if @serial.update(serial_params)
        format.html { redirect_to @serial, notice: 'Serial was successfully updated.' }
        format.json { render :show, status: :ok, location: @serial }
      else
        format.html { render :edit }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serials/1
  # DELETE /serials/1.json
  def destroy
    @serial.destroy
    respond_to do |format|
      format.html { redirect_to serials_url, notice: 'Serial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_serial
    @serial = Serial.find(params[:id])
  end

  def set_view_status
    @status = ViewStatus.find_by(serial_id: params[:id], user_id: params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def serial_params
    params.require(:serial).permit(:id, :title, :year_of_premiere, :description, :country_id, :image)
  end
end

# frozen_string_literal: true

class SerialsController < ApplicationController # :nodoc:
  before_action :set_serial, only: %i[show edit update destroy add_genre delete_genre add_actor delete_actor add_tag delete_tag add_view_status]
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
  end

  # GET /serials/1
  # GET /serials/1.json
  def show; end

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
        format.json { render :show, status: :created, location: @serial }
      else
        format.html { render :new }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
  end

  # GENRES
  def add_genre
    @serial.genres << Genre.find_by_id(params[:genre_select]) unless SerialGenre.find_by(serial_id: @serial.id, genre_id: params[:genre_select]).present?
    redirect_to @serial
  end

  def delete_genre
    @serial.genres.destroy(Genre.find_by_id(params[:genre_id]))
    redirect_to @serial
  end

  # ACTORS
  def add_actor
    @serial.actors << Actor.find_by_id(params[:actor_select]) unless SerialActor.find_by(serial_id: @serial.id, actor_id: params[:actor_select]).present?
    redirect_to @serial
  end

  def delete_actor
    @serial.actors.destroy(Actor.find_by_id(params[:actor_id]))
    redirect_to @serial
  end

  # TAGS
  def add_tag
    tag = Tag.find_or_create_by(tag_name: params.dig(:serial, :serial_tags, :tags, :tag))
    @serial.tags << tag unless SerialTag.find_by(serial_id: @serial.id, tag_id: tag.id).present?
    redirect_to @serial
  end

  def delete_tag
    @serial.tags.destroy(Tag.find_by_id(params[:tag_id]))
    redirect_to @serial
  end

  # add serial view status
  def add_view_status
    @serial.users_status.destroy(User.find_by_id(params[:user_id])) unless @status.nil?

    if params[:view_status].empty?
      redirect_to @serial
    else

      respond_to do |format|
        if @new_status.save
          format.json { render :show, status: :created, location: @serial, notice: 'View status was updated successfully.' }
          format.html { redirect_to @serial }
        else
          format.json { render json: @new_status.errors, status: :unprocessable_entity }
          format.html { redirect_to @serial }
        end
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

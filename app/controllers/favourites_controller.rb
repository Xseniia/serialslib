# frozen_string_literal: true

class FavouritesController < ApplicationController # :nodoc:
  before_action only: %i[show destroy]

  def create
    @serial = Serial.find_by id: params[:serial_id]
    @fav = Favourite.new(serial_id: params[:serial_id], user_id: current_user.id)

    respond_to do |format|
      if @fav.save
        format.html { redirect_to @serial, notice: 'Serial was successfully added to your favourites.' }
        format.json { render :show, status: :created, location: current_user }
      else
        format.html { rredirect_to @serial, alert: 'Serial is already in your favourites list.' }
        format.json { render json: @fav.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @serial = Serial.find_by id: params[:serial_id]
    current_user.serials_fav.delete(@serial)

    respond_to do |format|
      format.html { redirect_to @serial, notice: 'Serial was successfully removed from favourites.' }
      format.json { head :no_content }
    end
  end
end

# frozen_string_literal: true

class FavouritesController < ApplicationController # :nodoc:

  def create
    @serial = Serial.find_by id: params[:serial_id]
    @fav = Favourite.new(serial_id: params[:serial_id], user_id: current_user.id)

    respond_to do |format|
      if @fav.save
        format.html { redirect_to @serial, notice: 'Serial was successfully added to your favourites.' }
      else
        format.html { rredirect_to @serial, alert: 'Serial is already in your favourites list.' }
      end
    end
  end

  def destroy
    @serial = Serial.find_by id: params[:serial_id]
    current_user.serials_fav.delete(@serial)

    respond_to do |format|
      format.html { redirect_to @serial, notice: 'Serial was successfully removed from favourites.' }
    end
  end
end

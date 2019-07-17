class FavouritesController < ApplicationController
  before_action only: [:show, :destroy]

  def create
    @fav = Favourite.new
    @fav.serial_id = params[:serial_id]
    @fav.user_id = current_user.id

    @serial = Serial.find_by id: params[:serial_id]

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
    current_user.serials.delete(@serial)

    respond_to do |format|
      format.html { redirect_to @serial, notice: 'Serial was successfully removed from favourites.' }
      format.json { head :no_content }
    end
  end

end

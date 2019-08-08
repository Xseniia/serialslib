class RatingsController < ApplicationController
  def create
    @serial = Serial.find_by_id(params[:serial_id])

    if Rating.where(user_id: params[:user_id], serial_id: params[:serial_id]).any?
      @serial.users_rating.destroy(current_user)
    end

    @rating = Rating.new(user_id: params[:user_id], serial_id: params[:serial_id], value: params[:value])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @serial }
        format.json { render :show, status: :ok, location: @serial }
      else
        format.html { redirect_to @serial }
        format.json { render json: @serial.errors, status: :unprocessable_entity }
      end
    end
  end
end

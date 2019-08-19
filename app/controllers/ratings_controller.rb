class RatingsController < ApplicationController
  def create
    @serial = Serial.find_by_id(params[:serial_id])

    if Rating.where(user_id: params[:user_id], serial_id: params[:serial_id]).any?
      @serial.users_rating.destroy(current_user)
    end

    @rating = Rating.new(user_id: params[:user_id], serial_id: params[:serial_id], value: params[:value])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @serial, notice: 'Rating was successfully updated.' }
      else
        format.html { redirect_to @serial }
      end
    end
  end
end

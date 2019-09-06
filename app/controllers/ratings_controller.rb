class RatingsController < ApplicationController
  def create
    serial = Serial.find_by_id(params[:id])

    if Rating.where(user_id: params[:user_id], serial_id: params[:id]).any?
      serial.users_rating.destroy(User.find_by_id(params[:user_id]))
    end

    rating = Rating.new(user_id: params[:user_id], serial_id: params[:id], value: params[:value])
    if rating.save
      render json: {
        message: 'rating changed',
        rating: rating.value
      }, status: 200
    else
      render json: {
        message: 'rating saving failed'
      }, status: 400
    end
  end
end

# frozen_string_literal: true

class FavouritesController < ApplicationController # :nodoc:
  def create
    fav = Favourite.new(serial_id: params[:id], user_id: params[:user_id])

    if fav.save
      render json: {
        message: 'Successfully added',
        res: true
      }
    else
      render json: {
        message: 'Error',
        res: false
      }
    end
  end

  def destroy
    serial = Serial.find_by id: params[:id]
    user = User.find_by id: params[:user_id]
    user.serials_fav.delete(serial)

    render json: {
      message: 'Successfully deleted'
    }
  end
end

class GenresController < ApplicationController 
  before_action :set_serial, only: %i[add_genre delete_genre]

  def index
    @genres = Genre.all
    render json: { items: @genres }
  end

  def add_genre
    @serial.genres << Genre.find_by_id(params[:payload]) unless SerialGenre.find_by(serial_id: @serial.id, genre_id: params[:payload]).present?
    render json: { result: 'genre was successfully added' }
  end

  def delete_genre
    @serial.genres.destroy(Genre.find_by_id(params[:payload]))
    render json: { result: 'genre was successfully removed' }
  end

  private

  def set_serial
    @serial = Serial.find(params[:id])
  end
end
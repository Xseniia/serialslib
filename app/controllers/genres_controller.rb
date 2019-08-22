class GenresController < ApplicationController 
  def index
    @genres = Genre.all
    render json: { items: @genres }
  end
end
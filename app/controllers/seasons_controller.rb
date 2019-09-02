# frozen_string_literal: true

class SeasonsController < ApplicationController # :nodoc:
  before_action :set_season

  def index
    render json: {
      seasonIndex: Season.where(serial_id: @season.serial.id).find_index(@season) + 1,
      serialTitle: @season.serial.title,
      episodes: Episode.where(season_id: @season.id)
    }
  end

  def show; end

  def get_serial_seasons
    render json: { seasons: Season.where(serial_id: params[:serial_id]) }
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end
end

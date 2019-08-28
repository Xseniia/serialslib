# frozen_string_literal: true

class SeasonsController < ApplicationController # :nodoc:
  before_action :set_season, only: %i[show destroy]

  def show; end

  def get_serial_seasons
    render json: { seasons: Season.where(serial_id: params[:serial_id]) }
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end
end

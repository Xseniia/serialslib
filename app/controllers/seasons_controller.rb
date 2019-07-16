class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :destroy]

  def show
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end
end

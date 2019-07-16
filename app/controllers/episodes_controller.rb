class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :destroy]

  def show
  end

  private

  def set_episode
    @episode = Episode.find(params[:serial_id])
  end
end

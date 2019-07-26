# frozen_string_literal: true

class EpisodesController < ApplicationController # :nodoc:
  before_action :set_episode, only: %i[show destroy]

  def show; end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end
end

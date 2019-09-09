# frozen_string_literal: true

class EpisodesController < ApplicationController # :nodoc:
  before_action :set_episode, only: %i[index destroy episode_comments]

  def index
    render json: {
      episode: @episode,
      episodeIndex: Episode.where(season_id: @season.id).find_index(@episode) + 1,
      serialTitle: @season.serial.title,
      seasonIndex: Season.where(serial_id: @season.serial.id).find_index(@season) + 1
    }
  end

  def episode_comments
    comments = []
    Comment.where(episode_id: @episode.id).each do |comment|
      comments.push({
        id: comment.id,
        created_at: comment.created_at,
        comment_id: comment.comment_id,
        content: comment.content,
        user: User.find_by_id(comment.user_id)
        })
    end
    render json: {
      comments: comments
    }
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
    @season = Season.find(@episode.season.id)
  end
end

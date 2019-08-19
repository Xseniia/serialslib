# frozen_string_literal: true

class CommentsController < ApplicationController # :nodoc:
  before_action :find_commentable, only: :create

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.create(comment_params)
    @episode = Episode.find_by id: params[:episode_id]
    redirect_to season_episode_path(@episode.season, @episode)
  end

  def destroy
    @episode = Episode.find_by id: params[:episode_id]
    @comment = Comment.find_by id: params[:id]
    @episode.comments.destroy(@comment)

    respond_to do |format|
      format.html { redirect_to season_episode_path(@episode.season, @episode), notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def comment_params
    params[:comment].permit(:user_id, :episode_id, :content, :comment_id, :created_at)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    else
      @commentable = Episode.find_by_id(params[:episode_id])
    end
  end
end

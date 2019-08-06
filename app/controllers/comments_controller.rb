# frozen_string_literal: true

class CommentsController < ApplicationController # :nodoc:
  def new
    @comment = Comment.new
  end

  def create
    @episode = Episode.find(params[:episode_id])
    @comment = @episode.comments.create(params[:comment].permit(:user_id, :episode_id, :content, :comment_id, :created_at))
    redirect_to season_episode_path(@episode.season, @episode)
  end

  def destroy
    @episode = Episode.find_by id: params[:episode_id]
    @comment = Comment.find_by id: params[:id]
    @episode.comments.destroy(@comment)

    respond_to do |format|
      format.html { redirect_to season_episode_path(@episode.season, @episode), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

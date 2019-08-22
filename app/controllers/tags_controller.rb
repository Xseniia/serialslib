class TagsController < ApplicationController 
  def index
    @tags = Tag.all
    render json: { items: @tags }
  end
end

class TagsController < ApplicationController 
  before_action :set_serial, only: %i[add_tag delete_tag]

  def index
    @tags = Tag.all
    render json: { items: @tags }
  end

  def add_tag
    tag = Tag.find_or_create_by(tag_name: params[:payload])
    @serial.tags << tag unless SerialTag.find_by(serial_id: @serial.id, tag_id: tag.id).present?
    render json: { result: 'tag was successfully added' }
  end

  def delete_tag
    @serial.tags.destroy(Tag.find_by_id(params[:payload]))
    render json: { result: 'tag was successfully removed' }
  end

  private

  def set_serial
    @serial = Serial.find(params[:id])
  end
end

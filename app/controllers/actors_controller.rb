class ActorsController < ApplicationController 
  before_action :set_serial, only: %i[add_actor delete_actor]

  def index
    @actors = Actor.all
    render json: { items: @actors }
  end

  def add_actor
    @serial.actors << Actor.find_by_id(params[:payload]) unless SerialActor.find_by(serial_id: @serial.id, actor_id: params[:payload]).present?
    render json: { result: 'actor was successfully added' }
  end

  def delete_actor
    @serial.actors.destroy(Actor.find_by_id(params[:payload]))
    render json: { result: 'tag was successfully removed' }
  end

  private

  def set_serial
    @serial = Serial.find(params[:id])
  end
end

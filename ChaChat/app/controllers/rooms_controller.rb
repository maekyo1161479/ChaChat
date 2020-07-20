class RoomsController < ApplicationController
  before_action :set_target_room, only: %i[show destroy]
  def index
    @rooms = Room.all.order(:id)
  end

  def new
    @newroom = Room.create!
    redirect_to root_path, flash: { notice: "「ルーム#{@newroom.id}を作成しました」"}
  end

  def show
    @messages = @room.messages.order(:created_at)
  end

  def destroy
    @room.destroy
    redirect_to root_path, flash: { alert: "「ルーム#{@room.id}」が削除されました" } 
  end

  private

  def set_target_room
    @room = Room.find(params[:id])
  end 
end

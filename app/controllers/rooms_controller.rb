class RoomsController < ApplicationController
  before_action :authenticate_user!

  def new
    @room = Room.new(owner_id: current_user.id)
    if @room.save
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
      redirect_to room_path(@room), notice: "トークを開始しました！"
    end
  end

  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @users = User.where.not(id: current_user.id )
    @messages = @room.messages.order(:id)
  end

end

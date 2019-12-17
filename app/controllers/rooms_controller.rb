class RoomsController < ApplicationController
  before_action :authenticate_user!

  def new
    @room = Room.new(owner_id: current_user.id)
    if @room.save
      RoomUser.create!(room_id: @room.id, user_id: params[:user_id])
      redirect_to room_path(@room), notice: "トークを作成しました！"
    end
  end

  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @room_user = RoomUser.find_by(room_id: @room.id)
    @user = User.find_by(id: @room_user.user_id)
    @users = User.where.not(id: current_user.id )
    @messages = @room.messages.order(:id)
  end

end

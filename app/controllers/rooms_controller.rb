class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all.order(:id)
  end

  def new
    Room.create!
    redirect_to rooms_path
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.order(:id)
  end

end

class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id )
  end

  def show
    @users = User.where.not(id: current_user.id )
    @user = User.find(params[:id])
    @room = Room.find_by(owner_id: @user.id)
    @room_user = RoomUser.find_by(user_id: @user.id)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_following'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

end

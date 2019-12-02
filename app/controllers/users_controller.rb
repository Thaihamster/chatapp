class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id )
  end

  def show
    @users = User.where.not(id: current_user.id )
    @user = User.find(params[:id])
  end

end

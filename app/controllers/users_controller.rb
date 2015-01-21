class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

  end

  def follow
    user_followed = User.find(params[:id])
    user_follower = current_user
    redirect_to root_path, notice: 'Now your are following the user.' 
  end
end

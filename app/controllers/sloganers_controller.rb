class SloganersController < ApplicationController
  before_action :set_message, except: :index
  def index
    @sloganers = User.all
  end

  def show

  end
  
  def followers
    @followers = @sloganer.followers if @sloganer
  end

  def following
    @following = @sloganer.following if @sloganer
  end

  private
    def set_message
      @sloganer = User.find_by(username: params[:username])
    end
end

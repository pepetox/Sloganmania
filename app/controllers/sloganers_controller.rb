class SloganersController < ApplicationController
  before_action :set_message, only: :show
  def index
    @sloganers = User.all
  end

  def show
  end
  private
    def set_message
      @sloganer = User.find(params[:id])
    end
end

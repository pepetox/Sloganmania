class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
   before_action :set_sloganer, except: :new
  before_action :authenticate_user!, except: :index
  respond_to :html

  def index
    @messages = @sloganer.messages
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    if @message.save
        redirect_to root_path, notice: 'Message was successfully published.' 

      else
        render :new 
      end
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end
    def set_sloganer
     @sloganer = User.find_by(username: params[:username])
    end
    def message_params
      params.require(:message).permit(:content)
    end
end


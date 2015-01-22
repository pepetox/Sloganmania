class WelcomeController < ApplicationController
  def index
    @timeline_messages = current_user.get_timeline if current_user 
    @last_slogans = Message.last(10)
  end
end

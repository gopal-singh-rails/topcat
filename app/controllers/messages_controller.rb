class MessagesController < ApplicationController
  
  def index
    @conversations = current_user.all_conversations
  end
  
  def new
    @artists = User.artist
    @message = Message.new
  end
  
  def create
    
  end
end

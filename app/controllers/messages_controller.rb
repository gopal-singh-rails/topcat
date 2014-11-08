class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @conversations = current_user.all_conversations
  end
  
  def new
    @artists = User.artist
    @message = Message.new
  end
  
  def create
    receiver = User.find_by_email(params[:message][:receiver])
    Message.create!(sender: current_user, receiver: receiver, content: params[:message][:content])
    flash[:notice] = "Message sent successfully"
    redirect_to messages_path
  end
end

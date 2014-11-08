class MessagesController < ApplicationController
  
  before_filter :check_user, only: :new
  
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
    message = Message.create!(sender: current_user, receiver: receiver, content: params[:message][:content])
    Notification.send_message_notifiction(current_user, receiver, message).deliver
    flash[:notice] = "Message sent successfully"
    redirect_to messages_path
  end
  
  private

  def check_user
    flash[:alert] = "You havn't permission to access this page."
    redirect_to root_path unless current_user.client?
  end
end
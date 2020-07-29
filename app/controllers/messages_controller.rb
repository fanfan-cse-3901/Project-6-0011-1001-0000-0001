# File added and edited on 07/26/2020 by Prachiti Garge: Controller for messages
class MessagesController < ApplicationController
  # Message has to be a part of a conversation
  before_action :find_conversation

  def index
    @messages = @conversation.messages

    # If more than 10 messages, show only latest ten
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    @message = @conversation.messages.new
  end

  # Post
  def create
    @message = @conversation.messages.new(message_params)
    # If conversation already present between two users, redirect to it.
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  # Get
  def new
    @message = @conversation.messages.new
  end



  # Define methods
  private

  # Message has user id and content
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end

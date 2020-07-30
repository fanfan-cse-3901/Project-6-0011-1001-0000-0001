# File added and edited on 07/26/2020 by Prachiti Garge: Controller for conversations
class ConversationsController < ApplicationController
  # Make sure that user should have access to this conversation
  before_action :authenticate_user!

  # Where we find conversations
  def index
    @title = 'Conversation'
    @users = User.all
    @conversations = Conversation.all
  end

  # Post new conversation
  def create
    # If conversation already present, assign that to @conversation
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      # If conversation not present, make a new conversation
      @conversation = Conversation.create!(conversation_params)
    end
    # Redirect user to that conversation
    redirect_to conversation_messages_path(@conversation)
  end

  # Define method

  private

  # Conversation is between 2 people
  def conversation_params
    params.permit(:sender_id, :receiver_id)
  end
end

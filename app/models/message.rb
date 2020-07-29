# File added and edited on 07/26/2020 by Prachiti Garge: Model for messages
class Message < ApplicationRecord
  # Many to one relationship
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  # To label the time of message
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end

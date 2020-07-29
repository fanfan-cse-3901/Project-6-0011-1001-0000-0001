# File edited on 07/29/2020 by Prachiti Garge: Added commments
class Conversation < ApplicationRecord
  # Both attributes are foreign keys
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :receiver, foreign_key: :receiver_id, class_name: "User"
  # One to many relationship
  has_many :messages
  # Only one conversation between one buyer and seller
  validates_uniqueness_of :sender_id, scope: :receiver_id

  # This validation takes the sender_id and receiver_id for the conversation and checks whether a conversation exists
  # between the two ids because we only want two users to have one conversation.
  scope :between, -> (sender_id, receiver_id) do
    where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.sender_id = ? AND conversations.receiver_id = ?)", sender_id, receiver_id, receiver_id, sender_id)
  end
end

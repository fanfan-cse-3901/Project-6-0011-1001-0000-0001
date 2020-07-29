# File edited on 07/26/2020 by Prachiti Garge: Added the picture active storage
class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_one_attached :picture, dependent: :destroy

  has_many :transactions
  has_many :users, through: :transactions
end

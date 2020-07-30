class Transaction < ApplicationRecord
  belongs_to :item, foreign_key: :item_id, class_name: "Item"
  belongs_to :user, foreign_key: :user_id, class_name: "User"

  validates :item, presence: true
  validates :user, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5, nil] ,
                                  message: ' is not valid'}
end

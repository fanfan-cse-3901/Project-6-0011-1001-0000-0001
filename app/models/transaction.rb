class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :item, presence: true
  validates :user, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5, nil] ,
                                  message: ' is not valid'}
end

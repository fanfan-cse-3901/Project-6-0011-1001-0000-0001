# File edited on 07/26/2020 by Prachiti Garge: Added the picture active storage
class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_one_attached :picture, dependent: :destroy
  # Created on 07/25/2020 by Kevin Dong: search method
  def self.search(search, category)
    if search
      where('title LIKE ?', "%#{search}%")
      where('sub_category LIKE ?', category) if category != 'All'
    else
      all
    end
  end
end

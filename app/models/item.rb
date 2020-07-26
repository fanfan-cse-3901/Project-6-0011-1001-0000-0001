class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  # Created on 07/25/2020 by Kevin Dong: search method
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end

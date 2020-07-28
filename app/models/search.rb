# frozen_string_literal: true

# search
class Search < ApplicationRecord
  # search items
  def search_items
    items = Item.all
    items = items.where(['sub_category LIKE ?', sub_category]) if sub_category.present?
    items = items.where(['title LIKE ?', "%#{keywords}%"]) if keywords.present?
    items = items.where(['color LIKE ?', color]) if color.present?
    items = items.where(['quality LIKE ?', quality]) if quality.present?
    items = items.where(['price LIKE ?', price]) if price.present?
    items = items.where(['location LIKE ?', location]) if location.present?
    items
  end
end

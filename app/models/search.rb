# frozen_string_literal: true

class Search < ApplicationRecord
  def self.search_items(params)
    items = Item.all
    items = items.where('title LIKE ?', "%#{params[:keywords]}%") if params[:keywords].present?
    items = items.where('color LIKE ?', params[:color]) if params[:color].present?
    items = items.where('quality LIKE ?', params[:quality]) if params[:quality].present?
    items = items.where('price LIKE ?', params[:price]) if params[:price].present?
    items = items.where('location LIKE ?', params[:location]) if params[:location].present?
    items
  end
end

# frozen_string_literal: true

class SearchesController < ApplicationController
  def index
    @search = Search.new
    items = Item.all
    items = items.where('title LIKE ?', "%#{params[:keywords]}%") if params[:keywords] != ''
    items = items.where('color LIKE ?', params[:color]) if params[:color] != 'All'
    items = items.where('quality LIKE ?', params[:quality]) if params[:quality] != 'All'
    items = items.where('price LIKE ?', params[:price]) if params[:price] != ''
    items = items.where('location LIKE ?', params[:location]) if params[:location] != 'All'
    @items = items
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :sub_category, :color, :quality, :price)
  end
end

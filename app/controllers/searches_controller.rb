class SearchesController < ApplicationController
  def index
    @search = Search.new
    @items = Search.search_items(params)
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :sub_category, :color, :quality, :price)
  end
end

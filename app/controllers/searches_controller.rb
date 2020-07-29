class SearchesController < ApplicationController
  def index
    @search = Search.new
    @items = Search.search_items(params)
  end

  def create
    @items = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :sub_category, :color, :quality, :price)
  end
end

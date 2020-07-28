class SearchesController < ApplicationController
  def new
    @search = Search.search_items
  end

  def create
    @search = Search.create(search_params)
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

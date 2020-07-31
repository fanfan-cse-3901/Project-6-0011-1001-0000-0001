# File Edited on 07/23/2020 by Troy Stein: Forbidden edit posts for unauthorized user
# File Edited on 07/25/2020 by Yifan Yao: Replace render to redirect_back for unauthorized user
# File Edited on 07/25/2020 by Yifan Yao: Complete user authentication
# File Edited on 07/25/2020 by Yifan Yao: Add roles for Admin
# File Edited on 07/25/2020 by Yifan Yao: Integrate alert
# File Edited on 07/25/2020 by Yifan Yao: Get user_id by controller
# File Edited on 07/28/2020 by Kevin Dong: Refactored
# File Edited on 07/30/2020 by Yifan Yao: Anyone cannot edit/delete item when it sold
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  # File Edited on 07/25/2020 by Kevin Dong: Search implementation
  def index
    @title = 'Items'
    if params[:search]
      @items = Item.where('title LIKE ?', "%#{params[:search]}%")
      @items = Item.where('sub_category LIKE ?', params[:sub_category]) if params[:sub_category] != 'All'
    else
      @items = Item.all
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    get_avg_rating = "SELECT AVG(rating) FROM transactions
                      JOIN items ON transactions.item_id = items.id
                      WHERE items.user_id = #{@item.user_id};"
    rates = ActiveRecord::Base.connection.execute(get_avg_rating)
    @rating = rates[0]["AVG(rating)"]
  end

  # GET /items/new
  def new
    @title = 'New Item'
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @title = 'Edit Item'
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id && !current_user.admin
      respond_to do |format|
        format.html { redirect_to home_index_url, alert: 'You are not permitted to access this page.' }
      end
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if current_user.id == @item.user_id || current_user.admin
      respond_to do |format|
        if @item.update(item_params)
          format.html { redirect_to @item, notice: 'Item was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if (current_user.id == @item.user_id || current_user.admin) && (Transaction.find_by_item_id @item).nil?
      @item.destroy
      respond_to do |format|
        format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # File Edited on 07/23/2020 by Yifan Yao: Change from seller_id to user_id
  # File Edited on 07/25/2020 by Kevin Dong: Added search param
  def item_params
    params.require(:item).permit(:title, :quality, :price, :color, :location, :category, :sub_category, :description, :picture, :search)
  end
end

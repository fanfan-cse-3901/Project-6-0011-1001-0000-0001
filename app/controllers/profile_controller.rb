# frozen_string_literal: true

# File created 07/18/2020 by Amanda Cheng
# File edited 07/20/2020 by Amanda Cheng: Refactored method naming convention to fit snake case
# File Edited on 07/28/2020 by Kevin Dong: Refactored
# File Edited on 07/31/2020 by Yifan Yao: Redesign rating as helper method and use it anywhere
class ProfileController < ApplicationController
  include UsersHelper

  before_action :user_profile, only: [:show, :edit, :update, :destroy]
  # GET /profile
  def index
    #@profile = Profile.all
  end

  def show
    # @user = User.find(params[:id])
  end

  def new
    @item = Profile.new

  end

  # File Edited on 07/31/2020 by Yifan Yao: Display rating in user_profile
  def user_profile
    @title = 'User Profile'
    @full_name = current_user.full_name
    @email = current_user.email
    @purchases = Transaction.where(user_id: current_user.id)
    # item is an array of arrays
    @user_items = []
    @rating = avg_rating current_user.id
    # p = Profile.new item: 'amanda'
    #
    # p.save

    # @item = Items.all
    # @user_items = Item.find_by(:user_id, conditions =>['user_id =?', user_id])
    # Get array of items
    @item = Item.where(:user_id => current_user.id)
    @num_listings = @item.count
  end

  # GET /profile/new
  def create
    # @profile = current_user.profile.build
    @item = Item.new(profile_params)
    if @item.save
      #initially was redirect to profile_path
      # redirect_to '/profile/user/profile'
      format.html { redirect_to '/profile/user_profile', notice: 'Item was successfully created.' }
    else
      render 'new'
    end
  end

  # GET /profile/1/edit
  def edit
    @item = Item.find(params[:id])
    render 'items/edit'
  end

  def update
    @item = Item.find(params[:id])
    @item.update(title: params[:item][:title])
    format.html { redirect_to '/profile/user_profile', notice: 'Item was successfully updated.' }
    # redirect_to '/profile/user_profile'# profile_path(@item)

    # respond_to do |format|
    #   if @profile.update(profile_params)
    #     # format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
    #    format.html { redirect_to '/profile/user_profile', notice: 'Profile was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @profile }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @profile.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @profile = Item.find(params[:id])
    @profile.destroy
    respond_to do |format|
      #profiles_url
      format.html { redirect_to '/profile/user_profile', notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile_params
    params.permit(:title)
  end
end

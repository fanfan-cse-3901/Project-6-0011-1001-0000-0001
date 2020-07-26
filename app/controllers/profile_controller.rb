# File created 07/18/2020 by Amanda Cheng
# File edited 07/20/2020 by Amanda Cheng: Refactored method naming convention to fit snake case
class ProfileController < ApplicationController
  # GET /profile
  def index
    # @profile = Post.all
  end

  def show
    # @user = User.find(params[:id])
  end

  def user_profile
    @title = 'User Profile'
    @user_attr = ['Username', 'Email', 'Number of Listings']
    @user_name = 'fill'
    @first_name = 'fill'
    @last_name = 'fill'
    @email = 'fill'

    # item is an array of arrays
    @item = [[]]
    p = Profile.new item: 'amanda'
    p.save
    @item = Profile.all
    @num_listings = Profile.count
  end

  # GET /profile/new
  def add_new_item
    # @profile = current_user.profile.build
  end

  # GET /profile/1/edit
  def edit

  end

end

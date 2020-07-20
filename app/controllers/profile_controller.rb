class ProfileController < ApplicationController
  # GET /profile
  def index
    @profile = Post.all
  end
  def show
    @user = User.find(params[:id])
  end
  def user_profile
    @title = 'User Profile'
    @user_attr = ['Username', 'Email', 'Number of Listings']
    @user_name = 'fill'
    @first_name = 'fill'
    @last_name = 'fill'
    @num_listings = 4
    # item is an array of arrays
    @item = [[]]

  end
  # GET /profile/new
  def add_new_item
    @profile = current_user.profile.build
  end
  # GET /profile/1/edit
  def edit

  end

end

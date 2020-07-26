# File created 07/18/2020 by Amanda Cheng
# File edited 07/20/2020 by Amanda Cheng: Refactored method naming convention to fit snake case
class ProfileController < ApplicationController
  before_action :user_profile, only: [:show, :edit, :update, :destroy]
  # GET /profile
  def index
    # @profile = Post.all
  end

  def show
    # @user = User.find(params[:id])
  end

  def new
    @item = Profile.new
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
    # p = Profile.new item: 'amanda'
    #
    # p.save
    @item = Profile.all
    @num_listings = Profile.count
  end

  # GET /profile/new
  def create
    # @profile = current_user.profile.build
    @item = Profile.new(profile_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  # GET /profile/1/edit
  def edit

  end

  def destroy

    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile_params
    params.require(:profile).permit(:item)
  end
end

# File created 07/18/2020 by Amanda Cheng
# File edited 07/20/2020 by Amanda Cheng: Refactored method naming convention to fit snake case
class ProfileController < ApplicationController
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
      #initially was redirect to profile_path
      redirect_to '/profile/user/profile'
    else
      render 'new'
    end
  end

  # GET /profile/1/edit
  def edit
    @item = Profile.find(params[:id])
  end

  def update
    @item = Profile.find(params[:id])
    @item.update(item: params[:profile][:item])
    redirect_to profile_path(@item)

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
    @profile = Profile.find(params[:id])
    @profile.destroy
    respond_to do |format|
      #profiles_url
      format.html { redirect_to '/profile/user_profile', notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile_params
    params.permit(:item)
  end
end

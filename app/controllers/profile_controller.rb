class ProfileController < ApplicationController
  def userProfile
    @title = 'User Profile'
    @user_name = 'fill'
    @first_name = 'fill'
    @last_name = 'fill'
    @num_listings = 4
    @item_names = []
  end
end

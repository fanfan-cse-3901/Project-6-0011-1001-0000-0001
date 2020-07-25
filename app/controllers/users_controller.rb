# File Edited on 07/25/2020 by Yifan Yao: Restrict general user to access index
# File Edited on 07/25/2020 by Yifan Yao: Integrate alert
class UsersController < ApplicationController
  def index
    if current_user.admin
      @users = User.all
    else
      respond_to do |format|
        format.html { redirect_to home_index_url, alert: 'You are not permitted to access this page.' }
      end
    end
  end
end

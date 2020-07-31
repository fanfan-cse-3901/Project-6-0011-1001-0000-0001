# File Edited on 07/25/2020 by Yifan Yao: Restrict general user to access index
# File Edited on 07/25/2020 by Yifan Yao: Integrate alert
# File Edited on 07/29/2020 by Yifan Yao: Add admin panel
# File Edited on 07/29/2020 by Yifan Yao: Refactor codes
# File Edited on 07/31/2020 by Yifan Yao: Redesign rating as helper method and use it anywhere
class UsersController < ApplicationController
  include UsersHelper

  def index
    @title = 'Users'
    if current_user.admin
      @users = User.all
    else
      respond_to do |format|
        format.html { redirect_to home_index_url, alert: 'You are not permitted to access this page.' }
      end
    end
  end

  def add_admin
    @title = 'Admin'
    if current_user.admin
      @users = User.where(admin: true)
    else
      respond_to do |format|
        format.html { redirect_to home_index_url, alert: 'You are not permitted to access this page.' }
      end
    end
  end

  def set_admin
    if current_user.admin
      @future_admin = User.find_by email: params[:email]
      if !@future_admin.nil?
        @future_admin.update(admin: true)
        respond_to do |format|
          if @future_admin.update(admin_params)
            format.html { redirect_to users_add_admin_path, notice: 'User was successfully updated.' }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to users_add_admin_path, alert: 'User cannot be updated.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_index_url, alert: 'You are not permitted to access this page.' }
      end
    end
  end

  def admin_params
    params.permit(:email)
  end
end

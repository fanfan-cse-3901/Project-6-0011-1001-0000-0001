# File Edited on 07/25/2020 by Yifan Yao: Restrict general user to access index
# File Edited on 07/25/2020 by Yifan Yao: Integrate alert
# File Edited on 07/29/2020 by Yifan Yao: Add admin panel
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

  def add_admin
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
      @future_admin.admin = true
      @future_admin.save

      respond_to do |format|
        if @future_admin.update(admin_params)
          format.html { redirect_to users_add_admin_path, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: users_add_admin_path, status: :unprocessable_entity }
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

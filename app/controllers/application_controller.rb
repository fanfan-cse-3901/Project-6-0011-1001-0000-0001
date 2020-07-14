class ApplicationController < ActionController::Base
  # File Edited on 07/13/2020 by Yifan Yao: Device initialized, users are required to get authenticated in advance
  before_action :authenticate_user!
end

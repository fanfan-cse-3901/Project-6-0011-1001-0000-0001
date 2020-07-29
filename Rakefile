# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

# File Edited on 07/27/2020 by Yifan Yao: Set first user as admin
task :promote_admin => :environment do
  User.first.update_attribute('admin', true)
end

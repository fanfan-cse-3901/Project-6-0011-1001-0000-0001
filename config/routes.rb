Rails.application.routes.draw do
  # File Edited on 07/13/2020 by Yifan Yao: Device initialized
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

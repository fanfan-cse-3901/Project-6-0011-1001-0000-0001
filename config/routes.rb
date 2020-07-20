Rails.application.routes.draw do
  # File Edited on 07/20/2020 by Yifan Yao: Items initialized
  get 'items/create'
  get 'items/edit'
  get 'items/remove'
  get 'items/view'
  # get 'profile/userProfile'
  get 'userProfile' => 'profile#userProfile'

  # File Edited on 07/14/2020 by Yifan Yao: Home initialized, as DocumentRoot
  get 'home/index'
  root to: 'home#index'
  # File Edited on 07/13/2020 by Yifan Yao: Device initialized
  # File Edited on 07/19/2020 by Yifan Yao: Link more views into controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

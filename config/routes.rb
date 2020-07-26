Rails.application.routes.draw do
  resources :profiles
  # File Edited on 07/25/2020 by Yifan Yao: Redirect list of user goes to users
  get 'users', to: 'users#index'
  # File Edited on 07/20/2020 by Kevin Dong: Navigation actions initialized
  get 'navigation/filters'
  get 'navigation/search_bar'
  get 'navigation/search'
  # File Edited on 07/20/2020 by Kevin Dong: Profile actions initialized
  get 'profile/modify_profile'
  get 'profile/modify_email'
  get 'profile/modify_pass'
  get 'profile/user_profile'
  get 'profile/create'
  get 'profile/destroy'
  get 'profile/new'
  get 'profile/edit'
  # File Edited on 07/20/2020 by Yifan Yao: Items initialized
  resources :items
  get 'items/create'
  get 'items/edit'
  get 'items/remove'
  get 'items/view'
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

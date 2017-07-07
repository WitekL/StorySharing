Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  get 'sessions/new', to:  'sessions#new'
  post 'sessions/login', to: 'sessions#create'
  delete 'sessions/logout', to: 'sessions#destroy'


  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

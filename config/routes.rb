Tic::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: "tutorials#index"
  
  resources :tutorials
  resources :sessions
  resources :users
  resources :likes
  resources :categories
end

Forum::Application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]

  root to: 'users#index'
end

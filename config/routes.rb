Forum::Application.routes.draw do
  resources :posts

  resources :topics

  resources :boards

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :users, only: [:index, :show]

  root to: 'users#index'
end

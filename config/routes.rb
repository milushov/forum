Forum::Application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :users, only: [:index, :show]

  root to: 'users#index'
end

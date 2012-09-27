Forum::Application.routes.draw do

  resources :boards do
    resources :topics do
      resources :posts
    end
  end

  devise_for :users,
    path_names: {sign_in: 'login', sign_out: 'logout'},
    controllers: { registrations: 'users/registrations' }

  resources :users, only: [:index, :show]

  root to: 'boards#index'
end

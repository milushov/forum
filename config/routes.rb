Forum::Application.routes.draw do

  resources :boards do
    resources :topics do
      resources :posts
    end
  end

  devise_for :users,
    path_names: {sign_in: 'login', sign_out: 'logout'},
    controllers: {omniauth_callbacks: 'omniauth_callbacks'}
    #controllers: { registrations: 'users/registrations' }

  resources :users, only: [:index, :show]

  root to: 'boards#index'
end

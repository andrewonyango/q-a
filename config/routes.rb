Makeitsnappy::Application.routes.draw do
  root to: "questions#index"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :questions, except: [:new]

  match '/register', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
end

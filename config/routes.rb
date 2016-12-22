Makeitsnappy::Application.routes.draw do
  root to: "questions#index"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end

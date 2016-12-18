Makeitsnappy::Application.routes.draw do
  root to: "questions#index"

  resources :user, only: [:new, :create]
end

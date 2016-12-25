Makeitsnappy::Application.routes.draw do
  root to: "questions#index"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :questions, except: [:new] do
    resources :answers, only: [:create]
  end

  match '/register', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/your_questions', to: 'questions#your_questions'
end

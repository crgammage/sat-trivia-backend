Rails.application.routes.draw do
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  resources :game_questions
  resources :user_games
  resources :questions
  resources :games
  resources :users
    post '/users', to: 'users#create'
    post '/users/login', to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

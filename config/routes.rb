Rails.application.routes.draw do
  root to: 'games#index'
  resources :games, only: [:index, :create, :new, :show]
  post '/objects/:game_id/:player_id', to: 'objects#create', as: 'new_object'
  get 'end_game/:id', to: 'games#end_game', as: 'end_game'
end

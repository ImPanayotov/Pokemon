Rails.application.routes.draw do
  resources :pokemons, only: %i[index show]
  root to: 'pokemons#index'
end

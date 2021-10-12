Rails.application.routes.draw do
  resources :pokemons, only: %i[index show]
  root to: 'pokemons#index'
  get '/update-pokemons', to: 'pokemons#update_pokemon_list'
end

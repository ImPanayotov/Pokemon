Rails.application.routes.draw do
  resources :pokemons, only: %i[index show update_pokemon_list]
  # root to: 'pokemons#index'
  get '/update-pokemons', to: 'pokemons#update_pokemon_list', defaults: { format: 'json' }
  root to: 'welcome#index'
end

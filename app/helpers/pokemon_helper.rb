module PokemonHelper
  def fetch_pokemons
    pokemons = $redis.get('pokemons')

    if pokemons.nil?
      pokemons = PokemonService.new.call
      $redis.set('pokemons', pokemons)
      $redis.expire('pokemons', 1.minute.to_i)
    end
  end
end

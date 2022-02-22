class PokemonService < ApplicationService
  def call
    pokemons = []

    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=1&offset=100')
    response = JSON.parse(response.body)

    response['results'].each do |key, _value|
      response = HTTParty.get(key['url'])
      response = JSON.parse(response.body)
      pokemons.push(response)
    end

    pokemons.map do |poke|
      pokemon = Pokemon.where(poke_id: poke['id']).first

      if pokemon
        pokemon.update(updated_at: Time.now)
      else

        Pokemon.create(
          poke_id: poke['id'],
          name: poke['forms'][0]['name'],
          base_experience: poke['base_experience'],
          height: poke['height'],
          weight: poke['weight'],
          order: poke['order'],
          is_default: poke['is_default']
        )
      end

      type_name = poke['types'][0]['type']['name']

      Type.where(name: type_name).first_or_create(name: type_name)

      if pokemon.types.nil?
        pokemon.types.create(name: type_name)
      end

      pokemons
    end
  end
end

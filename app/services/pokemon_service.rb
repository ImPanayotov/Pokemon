class PokemonService
  def self.to_json
    pokemons = []

    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=10&offset=100')
    response = JSON.parse(response.body)
    response.each do |k, value|
      next unless k == 'results'

      value.each do |key, _val|
        response = HTTParty.get(key['url'])
        response = JSON.parse(response.body)
        pokemons.push(response)
      end
    end

    pokemons.map do |poke|
      binding.pry
      Pokemon.new(
        img: poke['sprites']['other']['dream_world']['front_default'],
        name: poke['forms'][0]['name'], weight: poke['weight'],
        poke_type: poke['types'][0]['type']['name'],
        poke_ability: poke['abilities'][0]['ability']['name'],
        poke_id: poke['id']
      )
    end
  end
end

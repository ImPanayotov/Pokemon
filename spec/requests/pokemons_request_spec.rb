require 'rails_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe Pokemon, type: :request do
    let(:pokemon) { build_stubbed(:pokemon) }

    context 'GET /index' do
      it 'renders a succesfull response' do
        get pokemons_url
        expect(response).to be_successful
      end

      it 'returns 10 pokemon' do
        get pokemons_url
        parsed_response = JSON.parse(response.body)
        pokemon_count = parsed_response.count
        expect(pokemon_count).to eq(10)
      end

      it "returns 'electrode' as first pokemon" do
        get pokemons_url
        parsed_response = JSON.parse(response.body)
        first_pokemon = parsed_response.first
        expect(first_pokemon['name']).to eq('electrode')
      end

      it 'returns nil when trying to get 11th pokemon out of 10' do
        get pokemons_url
        parsed_response = JSON.parse(response.body)
        eleventh_pokemon = parsed_response[11]
        expect(eleventh_pokemon).to eq(nil)
      end
    end
  end
end

require 'rails_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe Pokemon, type: :request do
    let(:pokemon) { build_stubbed(:pokemon) }

    context 'GET /index' do
      it 'renders a succesfull response' do
        get pokemons_url
        expect(response).to be_successful
      end
    end
  end
end

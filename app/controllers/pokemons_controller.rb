class PokemonsController < ApplicationController
  before_action :set_pokemon, only: :show
  # GET /pokemons
  def index
    render json: { pokemons: PokemonService.to_json }
  end

  # GET /pokemons/1
  def show
    render json: @pokemon
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.fetch(:pokemon, {})
  end
end

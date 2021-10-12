class PokemonsController < ApplicationController
  before_action :set_pokemon, only: :show

  # GET /pokemons
  def index
    @pokemons = Pokemon.all.includes(:types).map do |pokemon|
      PokemonDecorator.decorate(pokemon).convert_for_index
    end
    render json: @pokemons
  end

  # GET /update_pokemon_list
  def update_pokemon_list
    PokemonService.new.call

    respond_to do |format|
      format.json { render json: { message: 'Successfully updates the list of Pokemon' } }
    end
  end

  # GET /pokemons/1
  def show
    render json: PokemonDecorator.decorate(@pokemon).convert_for_show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.where(poke_id: params['id']).first
  end

  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.fetch(:pokemon, {}).permit(:id)
  end
end

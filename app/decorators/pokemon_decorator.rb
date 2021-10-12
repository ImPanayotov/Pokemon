class PokemonDecorator < ApplicationDecorator
  def convert_for_index
    {
      poke_id: object.poke_id,
      name: object.name,
      types: create_types_arr(object)
    }
  end

  def convert_for_show
    {
      poke_id: object.poke_id,
      name: object.name,
      base_experience: object.base_experience,
      height: object.height,
      weight: object.weight,
      order: object.order,
      is_default: object.is_default,
      types: create_types_arr(object)
    }
  end

  private

  def create_types_arr(object)
    object.types.map do |type|
      { name: type.name }
    end
  end
end

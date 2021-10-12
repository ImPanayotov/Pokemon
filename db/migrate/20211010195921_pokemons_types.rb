class PokemonsTypes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :pokemons, :types
    add_index :pokemons_types, %i[pokemon_id type_id], unique: true
  end
end

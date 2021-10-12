class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :poke_id, null: false, index: { unique: true }
      t.string :name, limit: 255, null: false, index: { unique: true }
      t.integer :base_experience
      t.integer :height
      t.integer :weight
      t.integer :order
      t.boolean :is_default

      t.timestamps
    end
  end
end

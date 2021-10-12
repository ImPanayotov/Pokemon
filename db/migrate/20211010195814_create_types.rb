class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name, limit: 255, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

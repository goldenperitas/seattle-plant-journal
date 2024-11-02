class CreateCreatures < ActiveRecord::Migration[7.2]
  def change
    create_table :creatures do |t|
      t.string :english_name, null: false
      t.string :scientific_name
      t.text :description

      t.timestamps
    end
  end
end

class AddSlugToCreatures < ActiveRecord::Migration[7.2]
  def change
    add_column :creatures, :slug, :string
    add_index :creatures, :slug, unique: true
  end
end

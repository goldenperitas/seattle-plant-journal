class AddColumnToCreature < ActiveRecord::Migration[7.2]
  def change
    add_column :creatures, :twulshootseed, :string
  end
end

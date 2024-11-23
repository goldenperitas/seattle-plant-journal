class AddColumnsToCreature < ActiveRecord::Migration[7.2]
  def change
    add_column :creatures, :other_english_names, :string
    add_column :creatures, :toxic_status, :integer, default: 0 # ENUM
  end
end

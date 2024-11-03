class CreateCreatureResources < ActiveRecord::Migration[7.2]
  def change
    create_table :creature_resources do |t|
      t.integer :resource_type, default: 0
      t.string :url
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

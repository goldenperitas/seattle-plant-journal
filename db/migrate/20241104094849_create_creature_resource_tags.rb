class CreateCreatureResourceTags < ActiveRecord::Migration[7.2]
  def change
    create_table :creature_resource_tags do |t|
      t.references :creature_resource, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

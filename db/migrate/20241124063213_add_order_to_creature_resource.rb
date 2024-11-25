class AddOrderToCreatureResource < ActiveRecord::Migration[7.2]
  def change
    add_column :creature_resources, :order, :integer
  end
end

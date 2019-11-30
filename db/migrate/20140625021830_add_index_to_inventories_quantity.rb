class AddIndexToInventoriesQuantity < ActiveRecord::Migration[5.2]
  def change
    add_index :inventories, :quantity
  end
end

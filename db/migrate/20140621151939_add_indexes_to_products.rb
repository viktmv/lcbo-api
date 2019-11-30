class AddIndexesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :products, [:is_dead, :inventory_volume_in_milliliters]
  end
end

class AddProducerIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :producer_id, :integer
    add_index :products, :producer_id
  end
end

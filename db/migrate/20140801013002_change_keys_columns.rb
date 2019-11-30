class ChangeKeysColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :keys, :is_public, :boolean, default: false, null: false
    add_column :keys, :domain,    :string,  limit: 100
    add_column :keys, :max_rate,  :integer
  end
end

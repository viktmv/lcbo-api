class ChangeKeysYetAgain < ActiveRecord::Migration[5.2]
  def change
    remove_column :keys, :is_public
    remove_column :keys, :max_rate

    add_column :keys, :kind, :integer, default: 0
  end
end

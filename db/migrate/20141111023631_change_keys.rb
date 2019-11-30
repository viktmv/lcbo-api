class ChangeKeys < ActiveRecord::Migration[5.2]
  def change
    add_column :keys, :in_devmode,  :boolean, default: false, null: false
    add_column :keys, :is_disabled, :boolean, default: false, null: false
  end
end

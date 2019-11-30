class DropSequelSchemaInfo < ActiveRecord::Migration[5.2]
  def up
    # Remove sequel schema_info table
    drop_table :schema_info
  end
end

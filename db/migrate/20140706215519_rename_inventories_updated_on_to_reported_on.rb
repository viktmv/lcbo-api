class RenameInventoriesUpdatedOnToReportedOn < ActiveRecord::Migration[5.2]
  def change
    rename_column :inventories, :updated_on, :reported_on
  end
end

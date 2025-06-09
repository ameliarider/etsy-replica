class RenameProductUserFieldToContainId < ActiveRecord::Migration[7.2]
  def change
    rename_column :products, :user, :user_id
  end
end

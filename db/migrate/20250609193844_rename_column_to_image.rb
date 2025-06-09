class RenameColumnToImage < ActiveRecord::Migration[7.2]
  def change
    rename_column :products, :shop_owner, :user
  end
end

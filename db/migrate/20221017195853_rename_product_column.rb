class RenameProductColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :user_id, :author_id
  end
end

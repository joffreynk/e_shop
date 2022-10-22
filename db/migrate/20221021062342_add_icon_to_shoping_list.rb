class AddIconToShopingList < ActiveRecord::Migration[7.0]
  def change
    add_column :shoping_lists, :icon, :string
  end
end

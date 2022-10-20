class CreateJoinCategoryWithShopingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :join_category_with_shoping_lists do |t|
      t.references :shoping_list, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

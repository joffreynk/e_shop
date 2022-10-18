# frozen_string_literal: true

class CreateJoinProductWithCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :join_product_with_categories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

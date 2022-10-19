class ShopingList < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :join_product_with_categories, dependent: :destroy
  has_many :categories, through: :join_product_with_categories
  validates :name, :amount, presence: true #, length: { minimum: 2 }
end

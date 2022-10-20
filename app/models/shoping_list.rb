class ShopingList < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :join_category_with_shoping_lists, dependent: :destroy
  has_many :categories, through: :join_category_with_shoping_lists
  validates :name, :amount, presence: true #, length: { minimum: 2 }
end

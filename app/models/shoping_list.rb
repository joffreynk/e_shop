class ShopingList < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :join_category_with_shoping_lists, dependent: :destroy
  has_many :categories, through: :join_category_with_shoping_lists
  validates :name,length: { minimum: 2 }
  validates :icon, length: { minimum: 10 }
  validates :name, :amount, :icon, presence: true 
  validates :amount, numericality: { greater_than: 0, only_float: true }
end

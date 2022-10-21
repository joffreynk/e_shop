class JoinCategoryWithShopingList < ApplicationRecord
  belongs_to :shoping_list
  belongs_to :category
  validates :category_id, :shoping_list_id, presence: true,  numericality: { greater_than: 0}
end

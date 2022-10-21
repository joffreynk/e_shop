class JoinCategoryWithShopingList < ApplicationRecord
  belongs_to :shoping_list
  belongs_to :category
end

class Category < ApplicationRecord
  # before_action :authenticate_user!
  belongs_to :user, dependent: :destroy
  has_many :join_product_with_categories, dependent: :destroy
  has_many :products, through: :join_product_with_categories

  validates :name, :icon, presence: true, length: { minimum: 2 }

end

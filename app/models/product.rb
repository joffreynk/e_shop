class Product < ApplicationRecord
  # before_action :authenticate_user!
  belongs_to :user, dependent: :destroy
  has_many :join_product_with_categories, dependent: :destroy
  has_many :categories, through: :join_product_with_categories

  validates :name,:amount, presence: true
  validates :name, length: { minimum: 2 }
end

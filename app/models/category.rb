class Category < ApplicationRecord
  # before_action :authenticate_user!
  belongs_to :user, dependent: :destroy
  has_many :join_category_with_shoping_lists, dependent: :destroy
  has_many :shoping_lists, through: :join_category_with_shoping_lists
  validates :name, :icon, presence: true
  validates :name, length: { minimum: 2 }
  validates :icon, length: { minimum: 10 }
end

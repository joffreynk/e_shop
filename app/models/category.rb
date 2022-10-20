# frozen_string_literal: true

class Category < ApplicationRecord
  # before_action :authenticate_user!
  belongs_to :user, dependent: :destroy
  has_many :join_category_with_shoping_lists, dependent: :destroy
  has_many :shoping_lists, through: :join_category_with_shoping_lists
  validates :name, :icon, presence: true, length: { minimum: 2 }
end

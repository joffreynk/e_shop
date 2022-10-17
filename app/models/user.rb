class User < ApplicationRecord
  has_many :product
  has_many :category

  validates :name, presence: true, length: { minimum: 2 }
end

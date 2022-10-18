# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :product, dependent: :destroy
  has_many :category, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2, too_short: '%<count> characters is the minimum allowed' }
end

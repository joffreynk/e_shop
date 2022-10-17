class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :product
  has_many :category

  # validates :name, presence: true, length: { minimum: 2 }

end

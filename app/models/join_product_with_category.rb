# frozen_string_literal: true

class JoinProductWithCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category
end

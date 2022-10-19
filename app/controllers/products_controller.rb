# frozen_string_literal: true
require 'date'

class ProductsController < ApplicationController

  def index
    # Product.create(id:Product.all.length+1, name:"lenovo", amount:145, author_id:1,created_at: DateTime.now(), updated_at: DateTime.now())
    ShopingList.create(name:"lenovo", amount:145, user_id:1)
    puts "items in database #{ShopingList.all.length}"
  end

  def new
    Product.create()
  end

  def create
  end

end

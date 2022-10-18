# frozen_string_literal: true

class CategoriesController < ApplicationController
  def def(index)
    @user_categories = Category.where(user_id: current_user.id)
  end

  def new
  end

  def create
    Category.create(name:params[:name], icon: params[:icon_link], user_id: current_user.id)
    redirect_to "/"
  end

end

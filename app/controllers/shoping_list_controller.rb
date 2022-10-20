
class ShopingListsController < ApplicationController

  def index
  end
  
  def new
    ShopingList.create(name: params[:name], amount: params[:amount], user_id: current_user.id)
  end

  def create
  end

end

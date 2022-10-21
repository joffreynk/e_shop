
class ShopingListsController < ApplicationController

  def index
    @single_category = Category.find_by(id: params[:id])
  end
  
  def new
    @brand_id = params[:id]
  end
  
  def create
    @item = ShopingList.create(name: params[:name], amount: params[:amount],icon:params[:icon_link], user_id: current_user.id)
    JoinCategoryWithShopingList.create(category_id: params[:brand_id], shoping_list_id: @item.id)
    redirect_to "/categories/#{params[:brand_id]}/shopinglists"
  end

end

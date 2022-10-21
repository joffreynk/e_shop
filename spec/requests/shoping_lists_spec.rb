require 'rails_helper'

RSpec.describe 'shopinglists', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )

    sign_in @user

    @category = Category.create(name: 'Smart phone', user_id: @user.id,
                                icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80')
    @shoping_list = ShopingList.create(name: 'samsung', amount: 12.3, user_id: @user.id,
                                       icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80')

    @shoping_list2 = ShopingList.create(name: 'Itel', user_id: @user.id, amount: 12.3,
                                        icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80')
    JoinCategoryWithShopingList.create(category_id: @category.id, shoping_list_id: @shoping_list.id)

    JoinCategoryWithShopingList.create(category_id: @category.id, shoping_list_id: @shoping_list2.id)
  end

  context '/categories/:id/shopinglists (GET #index)' do
    before(:each) { get "/categories/#{@category.id}/shopinglists" }

    it 'should be a success when called' do
      expect(response).to have_http_status(:ok)
    end

    it "should render index.html.erb file from views/shoping_lists (render 'index' template)" do
      expect(response).to render_template('index')
    end

    it "should render the correct content in the 'index' template" do
      expect(response.body).to include(@category.name)
    end

    it 'should render total costs of item bought' do
      expect(response.body).to include(@category.shoping_lists.sum(:amount).to_s)
    end
  end
end

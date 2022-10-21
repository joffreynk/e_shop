require 'rails_helper'

RSpec.describe 'categories index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Joffrey', email: 'joffrey@email.com', password: '112233',
                        password_confirmation: '112233', confirmed_at: Time.now)
    sign_in @user
    @category = Category.create(
      name: 'Smart phone', user_id: @user.id,
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80'
    )
    @shoping_list = ShopingList.create(
      name: 'samsung 1', amount: 12.3, user_id: @user.id,
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80'
    )
    @shoping_list2 = ShopingList.create(name: 'samsung 2', amount: 12.3, user_id: @user.id,
                                        icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80')
    JoinCategoryWithShopingList.create(category_id: @category.id, shoping_list_id: @shoping_list.id)
    JoinCategoryWithShopingList.create(category_id: @category.id, shoping_list_id: @shoping_list2.id)
    @shoping_list3 = ShopingList.create(
      name: 'samsung 3', amount: 12.3, user_id: @user.id,
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80'
    )
    @shoping_list4 = ShopingList.create(name: 'samsung 4', amount: 12.3, user_id: @user.id, icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80')
    JoinCategoryWithShopingList.create(category_id: @category.id, shoping_list_id: @shoping_list3.id)
    JoinCategoryWithShopingList.create(category_id: @category.id, shoping_list_id: @shoping_list4.id)
    visit "/categories/#{@category.id}/shopinglists"
  end

  it 'should have 4 Items' do
    expect(page).to have_content('samsung 1')
    expect(page).to have_content('samsung 2')
    expect(page).to have_content('samsung 3')
    expect(page).to have_content('samsung 4')
  end

  it 'should have total price for the given category' do
    expect(page).to have_content(@category.shoping_lists.sum(:amount).to_s)
  end

  it 'should have price each Item' do
    expect(page).to have_content(@shoping_list3.amount.to_s)
  end

  it 'should have an add product button' do
    expect(page).to have_link('Add')
  end

  it 'add product button should redirect to new Item/product page' do
    click_link('Add')
    expect(current_path).to eq("/categories/#{@category.id}/shopinglists/new")
  end
end

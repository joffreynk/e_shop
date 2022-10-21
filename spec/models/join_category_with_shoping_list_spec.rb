require 'rails_helper'

RSpec.describe JoinCategoryWithShopingList, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )

    @category = Category.create(
      name: 'Smart phone',
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
      user_id: @user.id,
    )

    @shoping_list = ShopingList.create(
        name: 'samsung',
        amount: 12.3,
        icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
        user_id: @user.id
      )
      @joined = JoinCategoryWithShopingList.create(
        category_id: @category.id,
        shoping_list_id: @shoping_list.id
      )
    end

  it 'create join with category and shoping list' do
    expect(@joined).to be_valid
  end

  it 'category id should not be nil' do
    @joined.category_id = nil
    expect(@joined).to_not be_valid
  end

  it 'category id must be a number' do
    @joined.category_id = 'some text'
    expect(@joined).to_not be_valid
  end

  it 'shoping list id should not be nil' do
    @joined.category_id = nil
    expect(@joined).to_not be_valid
  end

  it 'shoping list id must be a number' do
    @joined.category_id = 'good'
    expect(@joined).to_not be_valid
  end

end
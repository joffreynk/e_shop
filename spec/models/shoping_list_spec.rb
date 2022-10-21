require 'rails_helper'

RSpec.describe ShopingList, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )
    @shoping_list = ShopingList.create(
      name: 'samsung',
      amount: 12.3,
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
      user_id: @user.id
    )
  end

  it 'Shping list name should be present' do
    @shoping_list.name = nil
    expect(@shoping_list).to_not be_valid
  end

  it 'Shping list icon should not be nil' do
    @shoping_list.icon = nil
    expect(@shoping_list).to_not be_valid
  end

  it 'Shping list icon should be present' do
    @shoping_list.icon = 'hello'
    expect(@shoping_list).to_not be_valid
  end

  it 'Shping list icon should be present' do
    @shoping_list.icon = 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80'
    expect(@shoping_list).to be_valid
  end
end

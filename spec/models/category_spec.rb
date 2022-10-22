require 'rails_helper'

RSpec.describe Category, type: :model do
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
      user_id: @user.id
    )
  end

  it 'Category name should be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'Category Icon should not be nil' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'Category Icon should have 10 minimum characters' do
    @category.icon = 'hello'
    expect(@category).to_not be_valid
  end

  it 'Category Icon should be present' do
    @category.icon = 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80'
    expect(@category).to be_valid
  end
end

require 'rails_helper'

RSpec.describe 'categories index page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )
    sign_in @user

    Category.create(
      name: 'Smart phone 1',
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
      user_id: @user.id
    )
    Category.create(
      name: 'Smart phone 2',
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
      user_id: @user.id
    )
    Category.create(
      name: 'Smart phone 3',
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
      user_id: @user.id
    )
    Category.create(
      name: 'Smart phone 4',
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
      user_id: @user.id
    )
    visit '/'
  end

  it 'should have 4 categories' do
    expect(page).to have_content('Smart phone 1')
    expect(page).to have_content('Smart phone 2')
    expect(page).to have_content('Smart phone 3')
    expect(page).to have_content('Smart phone 4')
  end

  it 'should have an add Brand button' do
    expect(page).to have_link('Add Brand')
  end

  it 'add Brand button should redirect to new brand page' do
    click_link('Add Brand')
    expect(current_path).to eq('/categories/new')
  end
end

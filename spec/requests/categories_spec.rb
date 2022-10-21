require 'rails_helper'

RSpec.describe 'categories', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )

    sign_in @user

    @category = Category.create(
      name: 'Smart phone',
      icon: 'https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=489&q=80',
      user_id: @user.id,
    )
  end

  context '/ route (GET #index)' do
    before(:each) { get '/' }

    it 'should be a success when called' do
      expect(response).to have_http_status(:ok)
    end

    it "should render index.html.erb file from views/categories (render 'index' template)" do
      expect(response).to render_template('index')
    end

    it "should render the correct content in the 'index' template" do
      expect(response.body).to include( @category.name)
    end
  end
end

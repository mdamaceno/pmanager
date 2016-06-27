require 'rails_helper'

describe Site::SessionsController, type: :controller do
  let(:user) { create(:user, password: '123456', password_confirmation: '123456') }

  describe 'GET #new' do
    before do
      get :new
    end

    check_response_with_template('new', 'authentication/site/layouts/application')
  end

  describe 'POST #create' do
    it 'login' do
      post :create, user: { email: user.email, password: '123456' }
      expect(session[:user_id]).to eq(user.id)
    end

    it 'redirects to the home#index (homepage)' do
      post :create, user: { email: user.email, password: '123456' }
      expect(response).to redirect_to '/'
    end
  end
end

require 'rails_helper'

describe Site::UsersController, type: :controller do
  describe 'GET #new' do
    before do
      get :new
    end

    check_response_with_template('new', 'authentication/site/layouts/application')
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user in the database' do
        data = attributes_for(:user, password: '123456', password_confirmation: '123456')
        expect do
          post :create, user: data
        end.to change(User, :count).by(1)
      end

      it 'redirects to the welcome#index (homepage)' do
        post :create, user: single_user
        expect(response).to redirect_to '/'
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new user in the database' do
        conditions = [
          attributes_for(:user, name: nil),
          attributes_for(:user, email: nil),
          attributes_for(:user, password: nil, password_confirmation: '123456'),
          attributes_for(:user, password: '123456', password_confirmation: nil),
          attributes_for(:user, password: '123', password_confirmation: '123'),
          attributes_for(:user, password: SecureRandom.hex(90).to_s, password_confirmation: SecureRandom.hex(90).to_s)
        ]
        conditions.each do |data|
          expect do
            post :create, user: data
          end.to change(User, :count).by(0)
        end
      end
    end
  end
end

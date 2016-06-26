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
        expect do
          post :create, user: single_user
        end.to change(User, :count).by(1)
      end

      it 'redirects to the welcome#index' do
        post :create, user: single_user
        expect(response).to redirect_to '/'
      end
    end
  end
end

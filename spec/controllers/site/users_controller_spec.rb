require 'rails_helper'

describe Site::UsersController, type: :controller do
  describe 'GET #new' do
    before do
      get :new
    end

    check_response_with_template('new', 'authentication/site/layouts/application')
  end
end

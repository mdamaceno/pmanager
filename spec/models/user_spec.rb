require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid model' do
    user = {
      name: 'John Doe',
      email: 'johndoe@email.com',
      password: '123456',
      password_confirmation: '123456',
      role: 0
    }
    expect(User.new(user)).to be_valid
  end
end

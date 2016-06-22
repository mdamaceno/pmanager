FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    username Faker::Internet.user_name
    email Faker::Internet.email
    password_digest Faker::Internet.password(10)

    factory :normal_user do
      role 0
    end

    factory :admin_user do
      role 1
    end
  end
end

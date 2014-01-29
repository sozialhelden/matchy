# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    oauth_token           "token"
    oauth_secret          "secret"
    email                 "tim@example.com"
    password              "a_password"
    password_confirmation "a_password"
  end
end
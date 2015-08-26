require 'faker'

FactoryGirl.define do
  factory :user do |f|
    password = Faker::Internet.password
    f.email { Faker::Internet.email }
    f.password password
    f.password_confirmation password    
    f.confirmed_at Time.now
  end
end

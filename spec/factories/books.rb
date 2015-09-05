require 'faker'

FactoryGirl.define do
  factory :book do |f|
    f.title { Faker::Book.title }
    f.authors { Faker::Book.author }
    f.publisher { Faker::Book.publisher }
    f.isbn { Faker::Code.isbn }
    f.published_date '2015-08-22'
    f.language { Faker::Lorem.word }
    f.pages { Faker::Number.number(3) }
    f.category_id 1
    f.user_id 1
    f.association :category
    f.association :user
  end
end

class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  translates :name
end

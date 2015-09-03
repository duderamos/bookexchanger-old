require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create(:category) }

  it 'has a valid factory' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = FactoryGirl.build(:category, name: nil)
    expect(category).to be_invalid
  end

  it 'does not allow duplicated name' do
    another_category = FactoryGirl.build(:category, name: category.name)
    expect(another_category).to be_invalid
  end
end

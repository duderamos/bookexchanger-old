require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:c) { FactoryGirl.create(:category) }

  it 'has a valid factory' do
    expect(c).to be_valid
  end

  it 'be invalid without a name' do
    category = FactoryGirl.build(:category, name: nil)
    expect(category).to be_invalid
  end

  it 'does not allow duplicated name' do
    category = FactoryGirl.build(:category, name: c.name)
    expect(category).to be_invalid
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:u) { FactoryGirl.create(:user) }

  it 'has a valid factory' do
    expect(u).to be_valid
  end

  it 'does not allow duplicate user' do
    another_u = FactoryGirl.build(:user, email: u.email)
    expect(another_u).to be_invalid
  end

end

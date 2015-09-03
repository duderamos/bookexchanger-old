require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'does not allow duplicate user' do
    another_user = FactoryGirl.build(:user, email: user.email)
    expect(another_user).to be_invalid
  end

end

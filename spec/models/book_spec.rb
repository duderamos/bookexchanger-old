require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:b) { FactoryGirl.create(:book) }

  it 'has a valid factory' do
    expect(b).to be_valid
  end
  
  [ 'title', 'authors', 'isbn', 'publisher', 'published_date', 'language', 'pages', 'category_id', 'user_id' ].each do |attr|
    it "is invalid without a #{attr}" do
      expect(FactoryGirl.build(:book, "#{attr}": nil)).to be_invalid
    end
  end

  it 'be invalid with isbn too small' do
    expect(FactoryGirl.build(:book, isbn: 'asd')).to be_invalid
  end

end

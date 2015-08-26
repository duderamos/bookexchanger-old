require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:b) { FactoryGirl.create(:book) }

  it 'has a valid factory' do
    expect(b).to be_valid
  end
  
  [ 'title', 'authors', 'isbn', 'publisher', 'published_date', 'language', 'pages', 'category_id', 'user_id' ].each do |attr|
    it "is invalid without a #{attr}" do
      f = FactoryGirl.build(:book, "#{attr}": nil)
      expect(f).to be_invalid
    end
  end

  it 'has invalid with isbn too small' do
    f = FactoryGirl.build(:book, isbn: 'asd')
    expect(f).to be_invalid
  end

end

require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryGirl.create(:book) }

  it 'has a valid factory' do
    expect(book).to be_valid
  end
  
  [ 'title', 'authors', 'isbn', 'publisher', 'published_date', 'language', 'pages', 'category_id', 'user_id' ].each do |attr|
    it "is invalid without a #{attr}" do
      expect(FactoryGirl.build(:book, "#{attr}": nil)).to be_invalid
    end
  end

  it 'is invalid with isbn too small' do
    expect(FactoryGirl.build(:book, isbn: 'asd')).to be_invalid
  end

  it 'is invalid with negative page' do
    expect(FactoryGirl.build(:book, pages: -1)).to be_invalid
  end

  it 'is invalid with page as zero' do
    expect(FactoryGirl.build(:book, pages: 0)).to be_invalid
  end

end

require 'rails_helper'

RSpec.describe "books/show.html.haml", type: :view do
  let(:book) { FactoryGirl.build_stubbed(:book) }
  let(:user) { FactoryGirl.build_stubbed(:user) }

  before :each do
    allow(view).to receive(:current_user).and_return(user)
  end

  it "shows details of the book" do
    assign :book, book
    render
    expect(rendered).to have_selector 'h1', text: book.title
  end
end

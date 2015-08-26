require 'rails_helper'

RSpec.describe "home/index.html.haml", type: :view do
  it 'renders index correctly' do
    render
    expect(rendered).to match(/Let's spread knowledge!/)
  end
end

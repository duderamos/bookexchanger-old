require 'rails_helper'

RSpec.feature "Homepages", type: :feature do
  scenario 'when access homepage' do
    visit root_path
    expect(page).to have_content "Let's spread knowledge!"
  end
  scenario 'when access login page' do
    visit login_path
    expect(page).to have_content 'Login'
    expect(page).to have_button 'Log in'
  end
end

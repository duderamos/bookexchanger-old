require 'rails_helper'

RSpec.feature "Homepages", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'when access homepage' do
    visit root_path
    expect(page).to have_content "Let's spread knowledge!"
  end
  scenario 'when access login page' do
    visit login_path
    expect(page).to have_content 'Log in'
    expect(page).to have_button 'Log in'
  end
  scenario 'when user logs in' do
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end

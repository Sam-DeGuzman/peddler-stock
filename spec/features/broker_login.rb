require 'rails_helper'

RSpec.describe 'Login as a Broker User', type: :feature do
  let(:broker) { create :user, :broker }

  it 'logs the broker user in' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_email', with: broker.email
      fill_in 'user_password', with: broker.password

      click_on('Log in')
      expect(page).to have_current_path(brokers_path)
    end
  end
  
end

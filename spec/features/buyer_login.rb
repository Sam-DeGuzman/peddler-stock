require 'rails_helper'

RSpec.describe 'Login as a Buyer User', type: :feature, :js => true do
  let(:buyer) { create :user, :buyer }

  it 'logs the buyer user in' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_email', with: buyer.email
      fill_in 'user_password', with: buyer.password

      click_on('Log in')
      expect(page).to have_current_path(buyers_path)
    end
  end

end
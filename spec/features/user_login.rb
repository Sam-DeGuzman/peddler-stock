require 'rails_helper'

RSpec.describe 'Login as a Broker User', type: :feature, js: true do
  let(:broker) { create :user, :broker }
  let(:buyer) { create :user, :buyer }

  it 'logs the broker user in' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_email', with: broker.email
      fill_in 'user_password', with: broker.password

      click_on('Log in')
    end
    expect(page).to have_current_path brokers_path, ignore_query: true
  end

  it 'logs the buyer user in' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_email', with: buyer.email
      fill_in 'user_password', with: buyer.password

      # sleep 10.minutes
      click_on('Log in')
    end
    expect(page).to have_current_path buyers_path, ignore_query: true
  end

  it 'doesnt log the user in' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_email', with: 'buyer.email@gmail.com'
      fill_in 'user_password', with: '123456'

      # sleep 10.minutes
      click_on('Log in')
    end

    expect(page).to have_content 'Invalid Email or password.'
  end
end

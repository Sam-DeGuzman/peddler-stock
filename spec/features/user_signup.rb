require 'rails_helper'

RSpec.describe 'Sign up', type: :feature, js: true do
  it 'Signs up as a buyer' do
    visit new_user_registration_path

    within '#new_user' do
      fill_in 'user_firstname', with: 'Test'
      fill_in 'user_lastname', with: 'User'
      fill_in 'user_email', with: 'test.mail@gmail.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'

      click_on('Sign up')
    end
    expect(page).to have_content 'Please Check your Email for the status and/or confirmation of your registration.'
  end

  it 'Signs up as a broker' do
    visit new_user_registration_path

    within '#new_user' do
      page.select 'Broker', from: 'user_role_id'
      fill_in 'user_firstname', with: 'Test'
      fill_in 'user_lastname', with: 'User'
      fill_in 'user_email', with: 'test.mail@gmail.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'

      click_on('Sign up')
    end
    expect(page).to have_content 'Please Check your Email for the status and/or confirmation of your registration.'
  end

  it 'Shows error for empty firstname field' do
    visit new_user_registration_path

    within '#new_user' do
      fill_in 'user_lastname', with: 'User'
      fill_in 'user_email', with: 'test.mail@gmail.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_on('Sign up')
    end
    expect(page).to have_content "Firstname can't be blank !"
  end

  it 'Shows error for empty lastname field' do
    visit new_user_registration_path

    within '#new_user' do
      fill_in 'user_firstname', with: 'Test'
      fill_in 'user_email', with: 'test.mail@gmail.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_on('Sign up')
    end
    expect(page).to have_content "Lastname can't be blank !"
  end

  it 'Shows error for empty email field' do
    visit new_user_registration_path

    within '#new_user' do
      fill_in 'user_firstname', with: 'Test'
      fill_in 'user_lastname', with: 'User'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_on('Sign up')
    end
    expect(page).to have_content "Email can't be blank !"
  end

  it 'Shows error for password field' do
    visit new_user_registration_path

    within '#new_user' do
      fill_in 'user_firstname', with: 'Test'
      fill_in 'user_lastname', with: 'User'
      fill_in 'user_email', with: 'test.mail@gmail.com'
      fill_in 'user_password_confirmation', with: '123456'
      click_on('Sign up')
    end
    expect(page).to have_content "Password can't be blank !"
  end

  it 'Shows error for different password and confirmation' do
    visit new_user_registration_path

    within '#new_user' do
      fill_in 'user_firstname', with: 'Test'
      fill_in 'user_lastname', with: 'User'
      fill_in 'user_email', with: 'test.mail@gmail.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456A'
      click_on('Sign up')
    end
    expect(page).to have_content "Password confirmation doesn't match Password !"
  end
end

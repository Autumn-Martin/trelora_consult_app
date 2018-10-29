require 'rails_helper'

feature 'user login' do
  scenario 'user can login with correct email and password' do
    email = 'steven@trel.co'
    password = 'password'

    visit '/login'

    expect(page).to have_content("Listing Consultation Tool")
    expect(page).to have_content("Member Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Login")

    fill_in :email, with: email
    fill_in :password, with: password
    click_on 'Login'

    expect(current_path).to eq('/find')
    expect(page).to have_content('Pricing Location Address')
    expect(page).to have_button('Find Location')
  end

  scenario 'user unable to login with invalid email' do
    email = 'invalid@trel.co'
    password = 'password'

    visit '/login'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on 'Login'

    expect(current_path).to eq('/login')
    expect(page).to have_content('Member Email or Password Incorrect.')
  end

  scenario 'user unable to login with invalid password' do
    email = 'steven@trel.co'
    password = 'wrong'

    visit '/login'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on 'Login'

    expect(current_path).to eq('/login')
    expect(page).to have_content('Member Email or Password Incorrect.')
  end
end

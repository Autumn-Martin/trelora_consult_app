require 'rails_helper'

feature 'user login' do
  scenario 'user can login with correct email and password' do
    email = 'steven@trel.co'
    password = 'password'

    visit '/login'

    fill_in :login_email, with: email
    fill_in :login_password, with: password

    click_on 'Login'

    expect(current_path).to eq('/find')
    expect(page).to have_content('Pricing Location Address')
    expect(page).to have_button('Find Location')
  end
end

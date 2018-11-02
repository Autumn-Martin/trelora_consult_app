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
  
  scenario 'user can logout after finishing listing' do
    email = 'steven@trel.co'
    password = 'password'

    visit '/login'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on 'Login'
    
    select '1860 South Marion Street Denver CO 80210', from: :q
    click_on 'Find Location'
    click_on 'Begin Visit'
    
    fill_in :about_the_home, with: 'Spectacular'
    select 'Mild', from: :client_enthusiasm
    fill_in :buyer_agent_commission, with: '78%'
    fill_in :about_the_seller, with: 'Buying spaceship'
    fill_in :credit_card_number, with: '****_****_****_**42'
    fill_in :credit_card_expiration_date, with: 'Nov 30'
    
    click_on 'Save and Finish'

    expect(current_path).to eq('/success')
    click_on 'Logout'
    
    expect(current_path).to eq('/login')
    expect(page).to have_content('You have been successfully logged out!')
  end
end

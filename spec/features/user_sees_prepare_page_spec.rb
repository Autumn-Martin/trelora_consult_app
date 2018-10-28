require 'rails_helper'

feature 'registered user sees listing info' do
  scenario 'for selected address' do
    visit '/login'
    fill_in :email, with: "steven@trel.co"
    fill_in :password, with: "password"
    click_on "Login"

    visit '/find'
    select "1860 South Marion Street Denver CO 80210", from: :q
    click_on "Find Location"
    
    expect(current_path).to eq('/prepare')
    expect(page).to have_content('Address')
    expect(page).to have_content('Name:')
    expect(page).to have_content('Email:')
    expect(page).to have_content('Phone:')
    expect(page).to have_content('Coordinates:')
    expect(page).to have_content('Opted In:')
    expect(page).to have_content('Found Us Through:')
    expect(page).to have_content('Estimate:')
    expect(page).to have_content('Enthusiasm:')
    expect(page).to have_content('Timing:')
    expect(page).to have_content('Adopter Type:')
    expect(page).to have_content('Updates:')
    expect(page).to have_content('Stage:')
    expect(page).to have_content('Retainer:')
    # expect(page).to have_button('Go to Collect')
  end
end

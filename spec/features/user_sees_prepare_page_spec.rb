require 'rails_helper'

feature 'registered user sees listing info' do 
  scenario 'for selected address' do 
    visit '/login'

    email = 'steven@trel.co'
    password = 'password'

    fill_in :email, with: email
    fill_in :password, with: password

    click_on "Login"

    visit '/find'
    select "1860 South Marion Street Denver CO 80210", :from => :q
    click_on "Find Location"
    visit '/prepare'
    
    expect(current_path).to eq('/prepare')
    expect(page).to have_content('Name: Tyler Long')
    expect(page).to have_content('Email: tyler+12@trelora.com')
    expect(page).to have_content('Phone: 3033333333')
    expect(page).to have_content('Coordinates:')
    expect(page).to have_content('Opted In: true')
    expect(page).to have_content('Found Us: Google Search')
    expect(page).to have_content('Estimate: Zillow Details: 704000')
    expect(page).to have_content('Enthusiasm: Interested in Moving Forward')
    expect(page).to have_content('Timing: Less than 2 Months')
    expect(page).to have_content('Adopter Type: Early Adopter')
    expect(page).to have_content('Updates: ')
    
    expect(page).to have_content('Stage: Just getting interested in prepping home for sale. Wants to sell and use $$ to buy with us as well')
    expect(page).to have_content('Size: 3 Baths, 4 Beds')
  end 
end 
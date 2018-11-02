require 'rails_helper'

feature 'A user' do
  before do
    visit '/login'

    email = 'steven@trel.co'
    password = 'password'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on "Login"

    visit '/find'
  end

  scenario 'registered user sees listing info' do
    select "1860 South Marion Street Denver CO 80210", :from => :q
    click_on "Find Location"

    expect(current_path).to eq('/prepare')
    expect(page).to have_content('Name: Tyler Long')
    expect(page).to have_content('Email: tyler+12@trelora.com')
    expect(page).to have_content('Phone: 3033333333')
    expect(page).to have_content('Opted In: true')
    expect(page).to have_content('Found Us: Google Search')
    expect(page).to have_content('Enthusiasm: Interested in Moving Forward')
    expect(page).to have_content('Timing: Less than 2 Months')
    expect(page).to have_content('Adopter Type: Early Adopter')
    expect(page).to have_content('Zillow Pricing Estimates')
    expect(page).to have_css('.zillow_zestimate')
    expect(page).to have_css('.zillow_low_estimation')
    expect(page).to have_css('.zillow_high_estimation')
    expect(page).to have_content('Home Junction Pricing Estimates')
    expect(page).to have_css('.home_juction_regional_average')
    expect(page).to have_css('.home_junction_low_estimation')
    expect(page).to have_css('.home_junction_high_estimation')
    expect(page).to have_content('Listing Details')
    expect(page).to have_content('Interior:')
    expect(page).to have_content('Exterior:')
    expect(page).to have_content('Stage: Just getting interested in prepping home for sale. Wants to sell and use $$ to buy with us as well')
    expect(page).to have_content('Zillow')
    expect(page).to have_link('View Home')
    expect(page).to have_content('Size: 3 Baths, 4 Beds')
    expect(page).to have_link('Begin Visit')
    expect(page).to have_link('1860 South Marion Street')
    expect(page).to have_content('Directions:')
  end
end

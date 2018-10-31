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

  scenario 'can search for location' do
    expect(page).to have_content("Pricing Location Address")
    expect(page).to have_button("Find Location")
  end

  scenario 'can view info about location' do
    select "1860 South Marion Street Denver CO 80210", from: :q
    click_on "Find Location"

    expect(current_path).to eq('/prepare')
    expect(page).to have_css('.name')
    expect(page).to have_css('.email')
    expect(page).to have_css('.phone')
    expect(page).to have_css('.opted_in')
    expect(page).to have_css('.found_us')
    expect(page).to have_css('.zillow_zestimate')
    expect(page).to have_css('.zillow_low_estimation')
    expect(page).to have_css('.zillow_high_estimation')
    expect(page).to have_css('.home_junction_regional_average')
    expect(page).to have_css('.home_junction_low_estimation')
    expect(page).to have_css('.home_junction_high_estimation')
    expect(page).to have_css('.enthusiasm')
    expect(page).to have_css('.timing')
    expect(page).to have_css('.adopter_type')
    expect(page).to have_css('.updates')
    expect(page).to have_css('.stage')
    expect(page).to have_css('.size')
  end

  scenario 'can search for location using text field' do

    fill_in :new_q, with: "1860_south_marion_street-Denver-CO-80210"

    click_on "Find Location"

    expect(current_path).to eq('/prepare')
  end
  scenario 'can search for location using text field' do

    fill_in :new_q, with: "1860 south marion street, Denver, CO, 80210"

    click_on "Find Location"

    expect(current_path).to eq('/prepare')
  end
  scenario 'fails to search when wrong address is entered' do

    fill_in :new_q, with: "123 easy street, denver, co, 80210"

    click_on "Find Location"

    expect(current_path).to eq('/find')
    expect(page).to have_content('Address Not Found')
  end
  scenario 'fails to search when wrong input is entered' do

    fill_in :new_q, with: "sefhesk sldfjdso 999"

    click_on "Find Location"

    expect(current_path).to eq('/find')
    expect(page).to have_content('Address Not Found')
  end
  scenario 'fails to search when no input is entered' do

    click_on "Find Location"

    expect(current_path).to eq('/find')
    expect(page).to have_content('Address Not Found')
  end
end

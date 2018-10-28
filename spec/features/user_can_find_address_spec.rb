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
    select "1860_south_marion_street-Denver-CO-80210", :from => :q
    click_on "Find Location"

    expect(current_path).to eq('/prepare')
    expect(page).to have_css('.name')
    expect(page).to have_css('.email')
    expect(page).to have_css('.phone')
    expect(page).to have_css('.opted_in')
    expect(page).to have_css('.found_us')
    expect(page).to have_css('.estimate')
    expect(page).to have_css('.enthusiasm')
    expect(page).to have_css('.timing')
    expect(page).to have_css('.adopter_type')
    expect(page).to have_css('.stage')
  end
end

require 'rails_helper'

feature 'A user' do
  before do
    visit '/find'
  end
  scenario 'can search for location' do
    expect(page).to have_content("Pricing Location Address")
    expect(page).to have_button("Find Location")
  end
  scenario 'can view info about location' do
    fill_in :properties_address, with: "1860 S Marion St, Denver, CO 80210"
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

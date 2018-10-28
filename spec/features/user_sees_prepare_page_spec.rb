require 'rails_helper'

feature 'registered user sees listing info' do 
  scenario 'for selected address' do 
    
    visit '/prepare'
    
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
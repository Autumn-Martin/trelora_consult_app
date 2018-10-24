require 'rails_helper'

describe 'A user visits login page' do
  it 'should see form' do
    visit '/login'

    expect(page).to have_content("TRELORA")
    expect(page).to have_content("Listing Consultation Tool")
    expect(page).to have_content("Member Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Login")
  end
end

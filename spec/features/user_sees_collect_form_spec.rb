require 'rails_helper'

feature 'A user' do
  scenario 'can view and fill out collect form' do

    visit '/collect'

    expect(page).to have_field(:about_the_home)
    expect(page).to have_field(:recommended_list_price)
    expect(page).to have_field(:update_client_enthusiasm)
    expect(page).to have_field(:buyer_agent_commission)
    expect(page).to have_field(:about_the_seller)
    expect(page).to have_field(:credit_card_number)
    expect(page).to have_field(:credit_card_expiration_date)
    expect(page).to have_button("Save")
    expect(page).to have_button("Save and Finish")

  end
end

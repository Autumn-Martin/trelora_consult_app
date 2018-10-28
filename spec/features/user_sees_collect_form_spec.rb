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

  scenario 'fills the collect form' do
    visit '/collect'

    fill_in :about_the_home, with: 'Very spacious'
    fill_in :recommended_list_price, with: 250900
    select 'Hot', from: :update_client_enthusiasm
    fill_in :buyer_agent_commission, with: '2%'
    fill_in :about_the_seller, with: 'Buying new condo'
    fill_in :credit_card_number, with: "****_****_****_****"
    fill_in :credit_card_expiration_date, with: 'Nov 22'

    click_on "Save"
  end
end

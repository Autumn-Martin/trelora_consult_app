require 'rails_helper'

feature 'A user' do
  scenario 'can view and fill out collect form' do

    visit '/collect'

    expect(page).to have_field(:about_the_home)
    expect(page).to have_field(:recommended_list_price)
    expect(page).to have_field(:client_enthusiasm)
    expect(page).to have_field(:buyer_agent_commission)
    expect(page).to have_field(:about_the_seller)
    expect(page).to have_field(:credit_card_number)
    expect(page).to have_field(:credit_card_expiration_date)
    expect(page).to have_button("Save!")
    expect(page).to have_button("Save and Finish")
  end

  scenario 'fills the collect form' do
    visit '/login'

    email = 'steven@trel.co'
    password = 'password'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on "Login"

    expect(current_path).to eq( "/find")

    select "1860 South Marion Street Denver CO 80210", from: :q
    click_on "Find Location"

    expect(current_path).to eq("/prepare")

    visit '/collect'

    fill_in :about_the_home, with: 'Spectacular'
    # fill_in :recommended_list_price, with: '250900'
    select 'Mild', from: :client_enthusiasm
    fill_in :buyer_agent_commission, with: '78%'
    fill_in :about_the_seller, with: 'Buying spaceship'
    fill_in :credit_card_number, with: '****_****_****_**42'
    fill_in :credit_card_expiration_date, with: 'Nov 50'

    click_on 'Save!'

    expect(current_path).to eq('/collect')
    expect(find_field(:about_the_home).value).to eq('Spectacular')
    expect(find_field(:buyer_agent_commission).value).to eq('78%')
    expect(find_field(:about_the_seller).value).to eq('Buying spaceship')
    expect(find_field(:credit_card_number).value).to eq('****_****_****_**42')
    expect(find_field(:credit_card_expiration_date).value).to eq('Nov 50')
  end
  scenario 'fills the collect form' do
    visit '/login'

    email = 'steven@trel.co'
    password = 'password'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on "Login"

    expect(current_path).to eq( "/find")

    select "1860 South Marion Street Denver CO 80210", from: :q
    click_on "Find Location"

    expect(current_path).to eq("/prepare")

    visit '/collect'

    fill_in :about_the_home, with: 'Wooowie spectacular'
    fill_in :recommended_list_price, with: '99999999'
    select 'Mild', from: :client_enthusiasm
    fill_in :buyer_agent_commission, with: '78%'
    fill_in :about_the_seller, with: 'Buying spaceship'
    fill_in :credit_card_number, with: '****_****_****_****'
    fill_in :credit_card_expiration_date, with: 'Nov 50'

    click_on 'Save and Finish'

    expect(current_path).to eq(success_path)
    expect(page).to have_content('Wooowie spectacular')
    expect(page).to have_content('78%')
    expect(page).to have_content('99999999')
    expect(page).to have_content('Buying spaceship')
    expect(page).to have_content('****_****_****_****')
    expect(page).to have_content('Nov 50')
  end
end

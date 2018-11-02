require 'rails_helper'

describe TreloraService do
  params = { about_this_home: 'Very spacious' }

  subject { TreloraService.new(params) }

  it 'exists' do
    expect(subject).to be_a(TreloraService)
  end

  context 'instance methods' do
    context '#update_listing_information' do
      it 'update the information' do
        token = "this_is_a_very_simple_auth_token_string"
        email = "steven@trel.co"
        address = "1860_south_marion_street-Denver-CO-80210"
        update_infos = subject.update_listing_information(token, email, address)
        update_info  = update_infos.first

        # require "pry"; binding.pry
        # expect(update_infos).to have_key :listing_consultation
        # expect(update_info[1][:consultation]).to have_key :recommended_list_price
        # expect(update_info[1][:consultation]).to have_key :client_enthusiasm
        # expect(update_info[1][:consultation]).to have_key :commission
        # expect(update_info[1][:consultation]).to have_key :about_the_seller
        # expect(update_info[1][:consultation]).to have_key :credit_card
        # expect(update_info[1][:consultation]).to have_key :exp_date
      end
    end
  end
end

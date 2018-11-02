require 'rails_helper'

describe Trelora::REST::UpdateService do
  params = { about_this_home: 'Very spacious' }

  subject { Trelora::REST::UpdateService.new(params) }

  it 'exists' do
    expect(subject).to be_a(Trelora::REST::UpdateService)
  end

  context 'instance methods' do
    context '#update_listing_information' do
      it 'update the information' do
        token = "this_is_a_very_simple_auth_token_string"
        email = "steven@trel.co"
        address = "1860_south_marion_street-Denver-CO-80210"
        update_infos = subject.update_listing_information(token, email, address).to_json

        update_info = JSON.parse(update_infos, symbolize_names: true)

        expect(update_info).to have_key :listing_consultation
      end
    end
  end
end

require 'rails_helper'

describe TreloraService do
  params = { email: 'steven@trel.co' }

  subject { TreloraService.new(params) }

  it 'exists' do
    expect(subject).to be_a(TreloraService)
  end

  context 'instance methods' do
    context '#update_listing_information' do
      it 'update the information' do
        update_infos = subject.update_listing_information
        update_info  = update_infos.first

        expect(update_info).to have_key :about_the_home
        expect(update_info).to have_key :recommended_list_price
        expect(update_info).to have_key :update_client_enthusiasm
      end
    end
  end
end

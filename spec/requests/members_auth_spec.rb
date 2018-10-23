require "rails_helper"

describe 'Member Auth API End Point' do
  it 'user can receive user data through POST request' do

    post "https://www.trylora.com/api/v0/turing/members", params: {email: "steven@trel.co", password: "password"}

    expect(response.status).to eq(200)
    expect(response.body).to have_key([:data][:user])
    expect(response.body).to have_key([:data][:user][:HTTP_ATUH_TOKEN])
  end
end

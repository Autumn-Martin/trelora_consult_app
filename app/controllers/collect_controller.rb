require "net/http"
require "uri"
class CollectController < ApplicationController

  def new
  end

  def create
    token = session[:user_token]

    update_uri = URI.parse("https://www.trylora.com/api/v0/turing/update_listing_consultation")
    http = Net::HTTP.new(update_uri.host, update_uri.port)
    http.use_ssl = true

    post_request = Net::HTTP::Post.new(update_uri.request_uri)
    post_request['Accept'] = 'application/json'
    post_request['Content-Type'] = 'application/json'
    update_attributes = { HTTP_AUTH_TOKEN: token,
                          email: 'steven@trel.co',
                          address: "1860_south_marion_street-Denver-CO-80210",
                          about_the_home: params[:about_the_home],
                          recommended_list_price: params[:recommended_list_price],
                          update_client_enthusiasm: params[:update_client_enthusiasm],
                          buyer_agent_commission: params[:buyer_agent_commission],
                          about_the_seller: params[:about_the_seller],
                          credit_card_number: params[:credit_card_number],
                          credit_card_expiration_date: params[:credit_card_expiration_date]
                      }
    post_request.body = update_attributes.to_json
    response = http.request(post_request)

    update_listing = JSON.parse(response.body)
  end

end

require "net/http"
require "uri"

module Trelora
  module REST
    class UpdateService
      def initialize(params)
        @about_the_home = params[:about_the_home]
        @recommended_price = params[:recommended_list_price]
        @enthusiasm = params[:update_client_enthusiasm]
        @buyer = params[:buyer_agent_commission]
        @seller = params[:about_the_seller]
        @credit_card = params[:credit_card_number]
        @expiration_date = params[:credit_card_expiration_date]
      end

      def update_listing_information(token, email, address)
        http = Net::HTTP.new(update_uri.host, update_uri.port)
        http.use_ssl = true
        post_request = Net::HTTP::Post.new(update_uri.request_uri)
        post_request['Accept'] = 'application/json'
        post_request['Content-Type'] = 'application/json'
        update_attributes = { HTTP_AUTH_TOKEN: token,
                              email: email,
                              address: address,
                              about_this_home: @about_the_home,
                              list_price: @recommended_price,
                              client_enthusiasm: @enthusiasm,
                              commission: @buyer,
                              about_the_seller: @seller,
                              credit_card: @credit_card,
                              exp_date: @expiration_date
                            }
        post_request.set_form_data(update_attributes)
        response = http.request(post_request)

        JSON.parse(response.body)
      end

      def update_uri
        URI.parse("https://www.trylora.com/api/v0/turing/update_listing_consultation")
      end
    end
  end
end

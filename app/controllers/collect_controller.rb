require "net/http"
require "uri"
class CollectController < ApplicationController

  def new
  end

  def create
    if params[:save]
      update_call
      render :new
    elsif params[:save_and_finish]
      updated = update_call
      redirect_to action: :success, updated: updated
    end
  end

  def update_call
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
                          about_this_home: params[:about_the_home],
                          list_price: params[:recommended_list_price],
                          client_enthusiasm: params[:update_client_enthusiasm],
                          commission: params[:buyer_agent_commission],
                          about_the_seller: params[:about_the_seller],
                          credit_card: params[:credit_card_number],
                          exp_date: params[:credit_card_expiration_date]
                      }
    post_request.set_form_data(update_attributes)
    response = http.request(post_request)

    update_listing = JSON.parse(response.body)
  end

  def success
    @updated = params["updated"]["listing_consultation"]
  end

end

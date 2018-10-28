require "net/http"
require "uri"

class PrepareController < ApplicationController
  def show
    token = session[:user_token]
    defined_params = {address: params["q"],
      HTTP_AUTH_TOKEN: token}
    
    defined_params = URI.encode_www_form(defined_params)

    address_uri = URI.parse("https://www.trylora.com/api/v0/turing/properties?#{defined_params}")
    http = Net::HTTP.new(address_uri.host, address_uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(address_uri.request_uri)
    request['Accept'] = 'application/json'
    request['Content-Type'] = 'application/json'
    response.body = http.request(request)

    # getting_response
    response = http.request(Net::HTTP::Get.new(address_uri.request_uri))

    address_data = JSON.parse(response.body)['result']

    @address = Address.new(address_data)
  end
end


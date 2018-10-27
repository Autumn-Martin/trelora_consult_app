require "net/http"
require "uri"

class PrepareController < ApplicationController
  def show
    token = session[:user_token]
    address = session[:addresses]

    params = {address: address[0],
      HTTP_AUTH_TOKEN: token}
    params = URI.encode_www_form(params)

    address_uri = URI.parse("https://www.trylora.com/api/v0/turing/properties?#{params}")
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

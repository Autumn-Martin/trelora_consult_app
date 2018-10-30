require "net/http"
require "uri"

class PrepareController < ApplicationController
  def show
    token = session[:user_token]
    session[:addresses].map do |unclean_address|
      formatted_address = format_address(unclean_address)
      if formatted_address == params["q"]
        params["q"] = unclean_address
      end
    end

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

    response = http.request(Net::HTTP::Get.new(address_uri.request_uri))

    address_data = JSON.parse(response.body)['result']
    @address = Address.new(address_data)
    @duration = Duration.new(params[:controller], params[:action])
    @duration.prepare_start_time
  end
  
  private
  def format_address(unclean_address)
    address_array = unclean_address.gsub(/[-_]/, " ").split
    address_array.map do |word|
    	if word.length <= 2
    		word.upcase
    	else
    		 word.capitalize
    	end
    end.join(" ")
  end
end

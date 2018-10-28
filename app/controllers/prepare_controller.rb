require "net/http"
require "uri"

class PrepareController < ApplicationController

  def show
    token = session[:user_token]

    unless params["q"] == ""
      session[:addresses].map do |unclean_address|
        formatted_address = format_address(unclean_address)
        if formatted_address == params["q"]
          params["q"] = unclean_address
        end
      end
      new_params = {address: params["q"],
        HTTP_AUTH_TOKEN: token}
    else
      unless params["new_q"] == ""
        clean_address = fix_manual_input_address(params["new_q"])
        new_params = {address: clean_address,
          HTTP_AUTH_TOKEN: token}
      end
    end
    unless new_params == nil
      defined_params = URI.encode_www_form(new_params)

      address_uri = URI.parse("https://www.trylora.com/api/v0/turing/properties?#{defined_params}")
      http = Net::HTTP.new(address_uri.host, address_uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(address_uri.request_uri)
      request['Accept'] = 'application/json'
      request['Content-Type'] = 'application/json'
      response.body = http.request(request)

      # getting_response
      response = http.request(Net::HTTP::Get.new(address_uri.request_uri))
      if JSON.parse(response.body)['result'].nil?
        flash[:notice] = "Address Not Found"
        redirect_to '/find'
      else
        address_data = JSON.parse(response.body)['result']
        @address = Address.new(address_data)
      end
    else
      flash[:notice] = "Address Not Found"
      redirect_to '/find'
    end
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

    def fix_manual_input_address(unclean_address)
      words = unclean_address.gsub(/[-_,]/, " ").split
      "#{words.first(4).join("_")}" + "-" + "#{words[-3].capitalize}" + "-" + "#{words[-2].upcase}"+ "-" + "#{words[-1]}"
    end
end

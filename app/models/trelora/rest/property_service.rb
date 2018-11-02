module Trelora
  module REST
    class PropertyService

      def initialize(params)
        @params = params
        @address = params[:address]
        @token = params[:HTTP_AUTH_TOKEN]
      end

      def result
        get_json['result']
      end

      private

      def get_json
        JSON.parse(retrieve_property_details.body)
      end

      def retrieve_property_details
        http = Net::HTTP.new(address_parse_url.host, address_parse_url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(address_parse_url.request_uri)
        request['Accept'] = 'application/json'
        request['Content-Type'] = 'application/json'

        http.request(request)

        http.request(Net::HTTP::Get.new(address_parse_url.request_uri))
      end

      def address_parse_url
        parsed_address = URI.encode_www_form(@params)
        URI.parse("https://www.trylora.com/api/v0/turing/properties?#{parsed_address}")
      end
    end
  end
end

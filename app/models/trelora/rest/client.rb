module Trelora
  module REST
    class Client

      def initialize(params)
        @email = params[:email]
        @password = params[:password]
        @token = nil
      end

      def members_uri
        URI.parse('https://www.trylora.com/api/v0/turing/members')
      end

      def authenticate!
        http = Net::HTTP.new(members_uri.host, members_uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(members_uri.request_uri)
        request['Accept'] = 'application/json'
        request['Content-Type'] = 'application/json'
        member = {'email' => @email, 'password' => @password}
        request.body = member.to_json
        response = http.request(request)
        client = JSON.parse(response.body)
        if client['data']['user']
          @token = client['data']['user']['HTTP_AUTH_TOKEN']
          'success'
        end
      end

      def token
        @token
      end
    end
  end
end

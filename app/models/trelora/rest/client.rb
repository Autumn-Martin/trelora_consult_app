module Trelora
  module REST
    class Client

      def initialize(params)
        @email = params[:email]
        @password = params[:password]
        @token = nil
      end
      
      def authenticate!
        response = member_service.retrieve_member(@email, @password)
        client = JSON.parse(response.body)
        if client['data']['user']
          @token = client['data']['user']['HTTP_AUTH_TOKEN']
          'success'
        end
      end

      def token
        @token
      end
      
      private
      
      def member_service
        MemberService.new
      end 
    end
  end
end

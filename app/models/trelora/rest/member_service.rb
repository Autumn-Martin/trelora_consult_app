module Trelora
  module REST
      class MemberService 
        
        def retrieve_member(email, password)
          http = Net::HTTP.new(parse_url.host, parse_url.port)
          http.use_ssl = true
          post_request = Net::HTTP::Post.new(parse_url.request_uri)
          post_request['Accept'] = 'application/json'
          post_request['Content-Type'] = 'application/json'
          member = {'email' => email, 'password' => password}
          post_request.body = member.to_json
          http.request(post_request)
        end
        
        private 
          def parse_url
            URI.parse(ENV['member_endpoint'])
          end
      end 
    end 
  end 
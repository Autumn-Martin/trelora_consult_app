class MemberVerify

  def initialize(params)
    @email = params[:email]
    @password = params[:password]
  end

  def find_member
    uri = URI.parse('https://www.trylora.com/api/v0/turing/members')
    member = {}
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request['Accept'] = 'application/json'
    request['Content-Type'] = 'application/json'
    member['email'] = @email
    member['password'] = @password
    request.body = member.to_json
    response = http.request(request)
  end


end

require "net/http"
require "uri"
class ZillowService
  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def retrieve_zillow
    connect
    make_request
  end

  private

  def connect
    http.use_ssl = true
  end

  def make_request
    request['Accept'] = 'application/json'
    request['Content-Type'] = 'application/json'
    xml = http.request(request).body # xml response
    extract_web_address(xml)
  end

  def extract_web_address(xml)
    doc = Nokogiri::XML(xml) # parse xml doc
    homedetails = doc.xpath("//homedetails")[0] # search xml #=> #(Element:0x3fc1fcdcb038 {name = "homedetails", children = [#(Text "https://www.zillow.com/homedetails/1860-S-Marion-St-Denver-CO-80210/13371534_zpid/")]})
    homedetails.text #=> https://www.zillow.com/homedetails/1860-S-Marion-St-Denver-CO-80210/13371534_zpid/
  end

  def http
    Net::HTTP.new(api_url.host, api_url.port)
  end

  def street_address
    @street.gsub(' ', '+')
  end

  def city_state
    x = @city + "%2C+" + @state + "%2C+" + @zip
  end

  def api_url
    URI.join("http://www.zillow.com/webservice/", "GetDeepSearchResults.htm?zws-id=X1-ZWz18a4pbgiqyz_493z4&address=#{street_address}&citystatezip=#{city_state}")
  end

  def request
    Net::HTTP::Get.new(api_url.request_uri)
  end

  def response
    http.request(Net::HTTP::Get.new(api_url.request_uri))
  end

end

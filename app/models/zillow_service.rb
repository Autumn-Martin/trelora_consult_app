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
    # xml = http.request(request).body # xml response
    # doc = Nokogiri::XML(xml) # parse xml doc
    # homedetails = doc.xpath("//homedetails")[0] # search xml #=> #(Element:0x3fc1fcdcb038 {name = "homedetails", children = [#(Text "https://www.zillow.com/homedetails/1860-S-Marion-St-Denver-CO-80210/13371534_zpid/")]})
    # homedetails.text #=> https://www.zillow.com/homedetails/1860-S-Marion-St-Denver-CO-80210/13371534_zpid/
  end

  private

  def connect
    http.use_ssl = true
  end

  def make_request
    request['Accept'] = 'application/json'
    request['Content-Type'] = 'application/json'
    response.body = http.request(request)
    xml = http.request(request).body # xml response
    doc = Nokogiri::XML(xml) # parse xml doc
    homedetails = doc.xpath("//homedetails")[0] # search xml #=> #(Element:0x3fc1fcdcb038 {name = "homedetails", children = [#(Text "https://www.zillow.com/homedetails/1860-S-Marion-St-Denver-CO-80210/13371534_zpid/")]})
    homedetails.text #=> https://www.zillow.com/homedetails/1860-S-Marion-St-Denver-CO-80210/13371534_zpid/
  end

  def http
    Net::HTTP.new(parsed_uri.host, parsed_uri.port)
  end

  def street_address
    @street.gsub(' ', '+')
  end

  def city_state
    x = @city + "%2C+" + @state + "%2C+" + @zip
  end

  def parsed_uri
    URI.join("http://www.zillow.com/webservice/", "GetDeepSearchResults.htm?zws-id=X1-ZWz18a4pbgiqyz_493z4&address=1860+South+Marion&citystatezip=Denver%2C+CO%2C+80210")
    # URI.parse("http://www.zillow.com/webservice/GetDeepSearchResults.htm?#{defined_params}")
  end

  # def defined_params
  #   params = { :'zws-id' => ENV["zillow_api_key"], # the formatting of zws-id is to escape the dash
  #              address: street_address,
  #              citystatezip: city_state,
  #            }
  #   URI.encode_www_form(params)
  # end

  def request
    Net::HTTP::Get.new(parsed_uri.request_uri)
  end

  def response
    http.request(Net::HTTP::Get.new(parsed_uri.request_uri))
  end

end

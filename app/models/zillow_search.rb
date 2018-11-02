class ZillowSearch
  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def retrieve_zillow
    ZillowService.new(street_address, city_state).retrieve_zillow
  end

  private

  def street_address
    @street.gsub(' ', '+')
  end

  def city_state
    @city + "%2C+" + @state + "%2C+" + @zip
  end
end

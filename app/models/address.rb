class Address
  attr_reader :street, :city, :state, :zip, :ext_updates, :int_updates, :name, :email, :phone, :opted_in, :found_us, :zillow_estimate, :zillow_low_estimation, :zillow_high_estimation, :home_junction_regional_average, :home_junction_low_estimation, :home_junction_high_estimation, :enthusiasm, :timing, :adopter_type, :stage, :baths, :beds

  def initialize(data)
    @street = data['listing']['address']['address1']
    @city = data['listing']['address']['city']
    @state = data['listing']['address']['state']
    @zip = data['listing']['address']['zip']
    @ext_updates = data['listing']['home_updates']['exterior']
    @int_updates = data['listing']['home_updates']['interior']
    @name = data['client']['client_info']['name']
    @email = data['client']['client_info']['email']
    @phone = data['client']['client_info']['phone']
    @opted_in = data['client']['opted_in']['result']
    @found_us = data['client']['found_us']
    @zillow_estimate = data['pricing_estimates']['zillow']['zestimate']
    @zillow_low_estimation = data['pricing_estimates']['zillow']['low']
    @zillow_high_estimation = data['pricing_estimates']['zillow']['high']
    @home_junction_regional_average = data['pricing_estimates']['home_junction']['regional_avg']
    @home_junction_low_estimation = data['pricing_estimates']['home_junction']['low']
    @home_junction_high_estimation = data['pricing_estimates']['home_junction']['high']
    @enthusiasm = data['client']['enthusiasm']
    @timing = data['client']['timing']
    @adopter_type = data['client']['adopter_type']
    @stage = data['client']['stage']
    @baths = data['listing']['baths']
    @beds = data['listing']['beds']
  end
end

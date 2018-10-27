class Address
  attr_reader :name, :email, :phone, :opted_in, :found_us, :zillow_estimate, :zillow_low_estimation, :zillow_high_estimation, :home_junction_estimate, :home_junction_low_estimation, :home_junction_high_estimation, :enthusiasm, :timing, :adopter_type, :stage

  def initialize(data)
    @name = data['client']['client_info']['name']
    @email = data['client']['client_info']['email']
    @phone = data['client']['client_info']['phone']
    @opted_in = data['client']['opted_in']['result']
    @found_us = data['client']['found_us']
    @zillow_estimate = data['pricing_estimates']['zillow']['zestimate']
    @zillow_low_estimation = data['pricing_estimates']['zillow']['low']
    @zillow_high_estimation = data['pricing_estimates']['zillow']['high']
    @home_junction_estimate = data['pricing_estimates']['zillow']['zestimate']
    @home_junction_low_estimation = data['pricing_estimates']['zillow']['low']
    @home_junction_high_estimation = data['pricing_estimates']['zillow']['high']
    @enthusiasm = data['client']['enthusiasm']
    @timing = data['client']['timing']
    @adopter_type = data['client']['adopter_type']
    @stage = data['client']['stage']
  end
end
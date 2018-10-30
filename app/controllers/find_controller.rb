class FindController < ApplicationController

  def show
    addresses = session[:addresses]
    @formatted_addresses = addresses.map do |unclean_address|
      format_address(unclean_address)
    end
    
    duration = Duration.new(params[:controller], params[:action])
    duration.prepare_end_time
  end
  
  private
  def format_address(unclean_address)
    address_array = unclean_address.gsub(/[-_]/, " ").split
    address_array.map do |word|
    	if word.length <= 2
    		word.upcase
    	else
    		 word.capitalize
    	end
    end.join(" ")
  end
end

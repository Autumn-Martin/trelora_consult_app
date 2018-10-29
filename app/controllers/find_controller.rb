class FindController < ApplicationController

  def show
    addresses = session[:addresses]
    @formatted_addresses = addresses.map do |unclean_address|
      format_address(unclean_address)
    end
    
    duration = Duration.new(params[:controller], params[:action])
    unless duration.prepare_start_time == nil
      flash[:notice] = "You left Prepare and have spent #{duration.total_prepare_time} on the prepare page"
    end
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

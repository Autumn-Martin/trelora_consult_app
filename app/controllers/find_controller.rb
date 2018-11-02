class FindController < ApplicationController

  def show
    addresses = session[:addresses]
    @formatted_addresses = addresses.map do |unclean_address|
      AddressCleaner.new.format_address(unclean_address)
    end
  end
end

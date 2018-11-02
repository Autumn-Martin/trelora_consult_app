class PrepareController < ApplicationController
  def show
    token = session[:user_token]
    addresses = session[:addresses]
    new_params = AddressCleaner.new(params, token, addresses).build_params
    unless new_params == nil
      property_search = Trelora::REST::PropertyService.new(new_params)
      if property_search.result.nil?
        flash[:notice] = "Address Not Found"
        redirect_to '/find'
      else
        address_data = property_search.result
        @address = Address.new(address_data)
      end
    else
      flash[:notice] = "Address Not Found"
      redirect_to '/find'
    end
  end
end

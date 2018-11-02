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
    
    if params["q"] != ""
      session[:choosen_address] = params[:q]
    elsif params["new_q"] != ""
      session[:choosen_address] = params[:new_q]
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

    def fix_manual_input_address(unclean_address)
      words = unclean_address.gsub(/[-_,]/, " ").split
      if words.count > 3
        "#{words.first(4).join("_")}" + "-" + "#{words[-3].capitalize}" + "-" + "#{words[-2].upcase}"+ "-" + "#{words[-1]}"
      end
    end
end

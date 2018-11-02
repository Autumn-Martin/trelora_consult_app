class AddressCleaner

  def initialize(params=nil, token=nil, addresses=nil)
    @params = params
    @token = token
    @addresses = addresses
  end

  def build_params
    unless @params["q"] == ""
      @addresses.map do |unclean_address|
        formatted_address = format_address(unclean_address)
        if formatted_address == @params["q"]
          @params["q"] = unclean_address
        end
      end
      {address: @params["q"], HTTP_AUTH_TOKEN: @token}
    else
      unless @params["new_q"] == ""
        if fix_manual_input_address(@params["new_q"])
          clean_address = fix_manual_input_address(@params["new_q"])
          {address: clean_address, HTTP_AUTH_TOKEN: @token}
        end
      end
    end
  end

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

  private
    def fix_manual_input_address(unclean_address)
      words = unclean_address.gsub(/[-_,]/, " ").split
      if words.count > 3
        "#{words.first(4).join("_")}" + "-" + "#{words[-3].capitalize}" + "-" + "#{words[-2].upcase}"+ "-" + "#{words[-1]}"
      end
    end
end

class AddressCleaner

  def initialize(params, token, addresses)
    @params = params
    @q = params["q"]
    @new_q = params["new_q"]
    @token = token
    @addresses = addresses
  end

  def build_params
    unless @q == ""
      @addresses.map do |unclean_address|
        formatted_address = format_address(unclean_address)
        if formatted_address == @q
          @q = unclean_address
        end
      end
      {address: @q, HTTP_AUTH_TOKEN: @token}
    else
      unless @new_q == ""
        if fix_manual_input_address(@new_q)
          clean_address = fix_manual_input_address(@new_q)
          {address: clean_address, HTTP_AUTH_TOKEN: @token}
        end
      end
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

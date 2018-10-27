class FindController < ApplicationController

  def show
    @addresses = session[:addresses]
  end

end

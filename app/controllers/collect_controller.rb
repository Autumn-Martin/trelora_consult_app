require "net/http"
require "uri"
class CollectController < ApplicationController
  def new
  end

  def create
    service = TreloraService.new(collect_params)
    if params[:save]
      service.update_listing_information(token, email, address)
      render :new
    elsif params[:save_and_finish]
      sleep(3)
      updated = service.update_listing_information(token, email, address)
      redirect_to action: :success, updated: updated
    end
  end

  def success
    @updated = params["updated"]["listing_consultation"]
  end

  private

  def collect_params
    params.permit(:about_the_home, :recommended_list_price, :update_client_enthusiasm, :buyer_agent_commission, :about_the_seller, :credit_card_number, :credit_card_expiration_date)
  end

  def token
    session[:user_token]
  end

  def email
    session[:email]
  end

  def address
    session[:choosen_address]
  end
end

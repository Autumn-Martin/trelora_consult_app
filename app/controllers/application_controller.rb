class ApplicationController < ActionController::Base
  before_action :on_page?
  
  def on_page?
    Duration.new(params[:controller], params[:action])
  end
end

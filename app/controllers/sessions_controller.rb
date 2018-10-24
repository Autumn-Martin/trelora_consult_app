class SessionsController < ApplicationController

  def new
  end

  def create
    @user = MemberVerify.new(params[:login]).find_member
    redirect_to '/find'
  end
end

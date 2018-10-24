class SessionsController < ApplicationController

  def new
  end

  def create
    response = MemberVerify.new(params[:login]).find_member
    if response['data']['user']
      session[:user_token] = response['data']['user']['HTTP_AUTH_TOKEN']
      redirect_to '/find'
    else
      flash[:notice] = 'Member Email or Password Incorrect.'
      render :new
    end
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    client = Trelora::REST::Client.new(params)
    if client.authenticate! == 'success'
      session[:user_token] = client.token
      session[:addresses] = client.address
      session[:email] = client.email

      redirect_to '/find'
    else
      flash.now[:notice] = 'Member Email or Password Incorrect.'
      render :new
    end
  end
  
  def destroy
    session.delete(:user_token)
    redirect_to login_path, notice: 'You have been successfully logged out!'
  end
end
class SessionsController < ApplicationController

  def new
  end

  def create
    user = MemberVerify.new(params[:login]).find_member
    binding.pry
    if user['data']['user']
      redirect_to '/find'
    elsif
      flash[:notice] = 'Member Email Not Found.'
      render :new
    else
      flash[:notice] = 'Member Password Incorrect.'
      render :new
    end
  end
end

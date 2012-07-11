class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    member = Member.find_by_email(params[:session][:email])
    if member && member.authenticate(params[:session][:password])
      sign_in_member member
      redirect_to member
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out_member
    redirect_to root_path
  end
end

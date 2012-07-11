class MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      sign_in_member @member
      flash[:success] = "Welcome to the IPSE Members Site!"
      redirect_to @member
    else
      render 'new'
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:success] = "Profile updated"
      sign_in_member @member
      redirect_to @member
    else
      render 'edit'
    end
  end
end

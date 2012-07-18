class MembersController < ApplicationController
  
  before_filter :p_signed_in_member, only: [:index, :edit, :update, :destroy]
  before_filter :p_correct_member,   only: [:edit, :update]
  before_filter :p_admin_member,     only: :destroy
  
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
      flash[:success] = "Welcome to the IPSE members page!"
      redirect_to @member
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @member.update_attributes(params[:member])
      flash[:success] = "Profile updated."
      sign_in_member @member
      redirect_to @member
    else
      render 'edit'
    end
  end
  
  def index
    @members = Member.paginate(page: params[:page])
  end
  
  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member destroyed."
    redirect_to members_path
  end
  
  private
  
    def p_signed_in_member
      unless signed_in_member?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
    
    def p_correct_member
      @member = Member.find(params[:id])
      redirect_to(root_path) unless current_member?(@member)
    end
    
    def p_admin_member
      redirect_to(root_path) unless current_member.admin?
    end
end

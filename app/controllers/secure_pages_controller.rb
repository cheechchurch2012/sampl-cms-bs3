class SecurePagesController < ApplicationController
  
  before_filter :p_signed_in_member, only: [:home]
  
  def home
  end
  
  private
  
    def p_signed_in_member
      unless signed_in_member?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
end

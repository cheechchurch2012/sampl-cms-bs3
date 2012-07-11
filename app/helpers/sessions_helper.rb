module SessionsHelper
  
  def sign_in_member(member)
    cookies.permanent[:remember_token] = member.remember_token
    self.current_member = member
  end
  
  def signed_in_member?
    !current_member.nil?
  end
  
  def current_member=(member)
    @current_member = member
  end
  
  def current_member
    @current_member ||= Member.find_by_remember_token(cookies[:remember_token])
  end
  
  def current_member?(member)
      member == current_member
  end
  
  def sign_out_member
    self.current_member = nil
    cookies.delete(:remember_token)
  end
end

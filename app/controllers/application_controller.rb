# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '8fc080370e56e929a2d5afca5540a0f7'
  before_filter :authorize

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected 
  def authorize
    unless Member.find_by_id(session[:member_id])
      flash[:notice] = "请登录会员帐户。"
      redirect_to :controller => 'member' , :action => 'login'
    end
    @cart = session[:cart] ||= Cart.new
  end
end

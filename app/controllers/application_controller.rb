# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '8fc080370e56e929a2d5afca5540a0f7'
  before_filter :authorize
  after_filter :visit_log

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected 
  def authorize
    unless session && Member.find_by_id(session[:member_id])
      flash[:notice] = "请登录会员帐户。"
      redirect_to :controller => 'member' , :action => 'login'
    end
    
    @cart = session[:cart] ||= Cart.new
  end
  
  def visit_log
    log = ActionLog.new 
    log.start_time = log.end_time = Time.now 
    log.total = 0
    log.controller = self.controller_name 
    log.action = self.action_name
    log.paraid = params[:id]
    log.userid = (session && session[:member_id]) ? session[:member_id] : 0 
    log.save
  end
  
end

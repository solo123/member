class QuotationsController < ApplicationController
  layout nil
  def index
    @current_member = Member.find(session[:member_id])
    if @current_member.level<1
      redirect_to :action => :member_level, :id => params[:id]  
    end
    @quotations = Quotation.last_quotations(params[:id])
  end
  
  def member_level
  end
end

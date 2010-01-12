class MemberController < ApplicationController
  skip_before_filter :authorize

  def login
    if request.post?
      member = Member.login(params[:name], params[:password])
      if member
        session[:member_id] = member.id
        respond_to do |format|
          format.html { redirect_to :action => "index" }
        end
        return
      end
      flash.now[:alert] = "登录账户或密码不对，请查正再输。"
    end
  end

  def logout
    session[:member_id] = nil
    redirect_to :controller => 'member'
  end
  
  def reg1
  end

  def reg2
    if request.post?
      @member = Member.find_by_mobile(params[:mobile])
      if (@member)
        flash[:notice] = "手机:" << @member.mobile << "已经登记注册，如果您忘记了密码，请点击“重发密码”可以重新生成密码并发送到您的手机上。" ;
        redirect_to :action => "reg1"
      else
        @member = Member.new
        @member.mobile = params[:mobile]
      end
    end
  end
    
  def reg3
    @member = Member.new(params[:member])
    if !@member.save
      redirect_to :action => 'reg2'
    end
  end
end

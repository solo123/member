class MemberController < ApplicationController
  skip_before_filter :authorize

  def login
    if request.post?
      member = Member.login(params[:name], params[:password])
      if member
        session[:member_id] = member.id
        redirect_to :controller => 'mobiles', :action => "index" 
        return
      end
      # reset password
      member = Member.find_by_mobile(params[:name])
      fp = ForgotPsw.last(:conditions => {:user_mobile => params[:name], :status => 0})
      if member && fp && fp.pin == params[:password]
        fp.status = 1
        fp.save!
        session[:member_id] = member.id
        redirect_to '/'
      end
      
      flash.now[:alert] = "登录账户或密码不对，请查正再输。"
    end
  end
  
  def logout
    session[:member_id] = nil
    redirect_to :controller => 'mobiles'
  end
  
  def reg1
  end

  def reg2
    if request.post?
      @member = Member.find_by_mobile(params[:mobile])
      if (@member)
        flash[:notice] = "会员:" << @member.mobile << "已经登记注册，如果您忘记了密码，请点击“重发密码”可以重新生成密码并发送到您的手机上。" ;
        redirect_to :action => "reg1"
      else
        @member = Member.new
        @member.mobile = params[:mobile]
      end
    end
  end
    
  def reg3
    @member = Member.new(params[:member])
    pin = "%04d" % rand(10000)
    if (Member.find_by_mobile(@member.mobile))
        flash[:notice] = "会员:" << @member.mobile << "已经登记注册，如果您忘记了密码，请点击“重发密码”可以重新生成密码并发送到您的手机上。" ;
        redirect_to :controller => "member", :action => "login"
    else
      @member.pin = pin
      if !@member.save
        flash[:notice] = "注册会员出错，请重新注册。"
        redirect_to :action => 'reg2'
      end
    end
    # success
    sms = Notifier.new
    sms.Send_Sms(@member.id, @member.mobile, "欢迎您成为酷购网会员，您的登录密码为:#{pin}，请登录www.coolpur.cn查询酷购直供信息。")
    sms.save!
    session[:member_id] = @member.id
  end
  
  def forgot
    if request.post?
      member = Member.find_by_mobile(params[:mobile])
      if !member
        flash[:notice] = "用户#{params[:mobile]}尚未登记注册，您可以<a href='reg0'>立即注册成为会员。</a>"
        return
      end
      pin = "%04d" % rand(10000)
      fp = ForgotPsw.new
      fp.user_mobile = params[:mobile]
      fp.pin = pin
      fp.date = Time.now
      sms = Notifier.new
      if params[:commit] == "发送短信到手机"
        fp.send_by = "PSW.SMS" 
        sms.Send_Sms(member.id, params[:mobile], "您在酷购网申请的重置密码为:#{pin}，请登录www.coolpur.cn修改您的登录密码。")
        sms.save!
        flash[:notice] = "您的密码已经通过短信发送到您的手机（应近期网络短信人工审查要求，您接收到短信的时间会延迟5至10分钟，晚上10:00pm后发送的短信需等到第二天通过人工审查后方能收到。）"
      else
        if member.email && member.email.length>6
          fp.send_by = "PSW.EMAIL" 
          sms.Send_Email(member.id, params[:mobile],"密码重置申请", "您在酷购网申请的重置密码为:<b>#{pin}</b>，请登录<a href='' target='_blank'>www.coolpur.cn</a>修改您的登录密码。")
          sms.save!
          flash[:notice] = "您的密码已经通过邮件发送到您的注册邮箱#{member.email}"
        else
          flash[:notice] = "您没有在您的会员信息中输入有效的Email地址，无法通过Email给您重设密码。"
          return
        end
      end
      fp.request_ip = request.remote_ip
      fp.status = 0
      fp.save!
      redirect_to :action => :login
    end
  end
end

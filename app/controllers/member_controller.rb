class MemberController < ApplicationController
  def index
  end

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
    respond_to do |format|
      format.html { render :layout => "login" }
    end
  end

  def logout
  end

end

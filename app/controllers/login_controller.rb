class LoginController < ApplicationController
  
  def login
    if request.post?
      member = Member.login(params[:name], params[:password])
      if member
        session[:member_id] = member.id
      else
        flash.now[:alert] = "登录账户或密码不对，请查正再输。"
      end
    end
    respond_to do |format|
      format.js
    end
  end
end

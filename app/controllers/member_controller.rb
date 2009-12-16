class MemberController < ApplicationController
  def index
  end

  def login
    if request.post?
      member = Member.authenticate(params[:name], params[:password])
      if member
        session[:member_id] = member.id
      else
        flash.now[:alert] = "用户名或密码不正确。"
      end
    end
  end

  def logout
  end

end

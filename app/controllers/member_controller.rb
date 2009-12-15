class MemberController < ApplicationController
  def index
  end

  def login
    if request.post?  
      if params[:name] && params[:password] && !params[:name].empty? && !params[:password].empty?
          redirect_to(:action => "index" )
      else
          flash.now[:alert] = "用户名或密码不正确。"
      end
    end       
  end

  def logout
  end

end

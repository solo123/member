# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_already_login?
    session && session[:member_id] && session[:member_id] > 0
  end
  

end

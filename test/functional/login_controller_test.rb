require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  fixtures :members

  test "login success" do
    xhr(:post, :login, {:name => "13728770073", :password => "333"})    
    assert_response :success
    assert_template "login"
    assert @response.has_session_object?(:member_id), "no member_id in session"
    assert_not_nil session[:member_id], "session is nil"
    assert_nil flash[:alert]
  end

  test "login failure" do
    xhr :post, :login, {:name => "bad name", :password => "bad pass"}
    assert_response :success
    assert_template "login"

    assert !@response.has_session_object?(:member_id), "bad login success."
    assert_not_nil flash[:alert]
  end

  test "login through other method" do
    get :login
    assert_response :found
    assert_redirected_to :controller => 'member', :action => 'index'
  end
end

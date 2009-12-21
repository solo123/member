require 'test_helper'

class MemberControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_response :success
  end
end

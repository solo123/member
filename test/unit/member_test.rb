require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  fixtures :members

  test "login" do
    member = Member.login("13728770073", "333")
    assert member, "user 13728770073 login fail."

    member = Member.login("13728770073", "bad pass")
    assert_nil member, "bad password can login"

    member = Member.login("bad mobile", "333")
    assert_nil member, "bad mobile can login"

    member = Member.login("bad mobile", "bad pass")
    assert_nil member, "anyone can login"
  end

end

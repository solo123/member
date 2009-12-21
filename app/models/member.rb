class Member < ActiveRecord::Base
  def self.login(name,password)
    member = Member.find_by_mobile(name)
    if member
      if member.pin != password
        member = nil
      end
      member
    end
  end
end

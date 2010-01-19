class Notifier < ActiveRecord::Base
  def Send_Sms(member_id, mobile, message)
    self.type = 'SMS'
    self.member_id = member_id
    self.address = mobile
    self.message = message
    self.send_date = Time.now
    self.status = 0    
  end
  
  def Send_Email(member_id, email, message)
    self.type = 'EMAIL'
    self.member_id = member_id
    self.address = email
    self.message = message
    self.send_date = Time.now
    self.status = 0
  end
end
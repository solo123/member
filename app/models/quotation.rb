class Quotation < ActiveRecord::Base

  def self.last_quotations(id)
    find(:all,:conditions =>{:mobile_id => id, :status => 3}, :order => "quotation_date desc" )
  end
end

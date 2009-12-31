class MobileController < ApplicationController
  def index
    @mobiles = Mobile.all(:limit => "10")
    
  end
end

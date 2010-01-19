class MobilesController < ApplicationController

  def index
    @recommand_mobiles = Mobile.all(:limit => "10")
  end

  def show
    @mobile = Mobile.find(params[:id])
    @brand = Brand.find(@mobile.brand_id)
  end
  
  def search
    model = params[:model]
    if model ==nil
      @mobiles = Mobile.all(:limit => 200)
    else
      @mobiles = Mobile.all(:conditions => ["name like ?", "%"+ model+"%"], :limit => 200)
    end
  end
end

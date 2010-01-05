class MobilesController < ApplicationController
  def show
    @mobile = Mobile.find(params[:id])
    @brand = Brand.find(@mobile.brand_id)
  end
  
  def quotations
    @quotations = Quotation.last_quotations(params[:id])
    render :layout => false
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

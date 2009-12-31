class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @mobiles = Mobile.find_all_by_brand_id(params[:id])
  end
end

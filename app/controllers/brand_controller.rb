class BrandController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    
  end

end

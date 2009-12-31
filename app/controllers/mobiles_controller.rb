class MobilesController < ApplicationController
  def show
    @mobile = Mobile.find(params[:id])
    @cart = session[:cart] ||= Cart.new

  end
end

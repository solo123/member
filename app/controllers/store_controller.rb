class StoreController < ApplicationController
  def find_cart
    session[:cart] ||= Cart.new
  end

  def add_to_cart
    mobile = Mobile.find(params[:id])
    @cart = find_cart
    @cart.add_mobile(mobile)
    redirect_to_index
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid mobile #{params[:id]}" )
    redirect_to_index("Invalid mobile")
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index("Your cart is currently empty")
  end

  private
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :controller => 'mobiles', :action => 'show'
  end

end

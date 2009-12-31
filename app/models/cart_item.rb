class CartItem
  attr_reader :mobile, :quantity
  def initialize(mobile)
    @mobile = mobile
    @quantity = 1
  end
  def increment_quantity
    @quantity += 1
  end
  def name
    @mobile.name
  end
  def price
    @mobile.price * @quantity
  end
end


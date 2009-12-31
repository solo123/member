class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_mobile(mobile)
    current_item = @items.find {|item| item.mobile == mobile}
    if current_item
      current_item.increment_quantity
    else
      @items << CartItem.new(mobile)
    end
  end

  def total_price
    @items.sum { |item| item.price }
  end

end

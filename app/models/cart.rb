class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def total_price
    @items.sum {|item| item.price }
  end

  def add_product(product, order) 
    @items << CartItem.new(product, order)
  end

end

class CartItem
  attr_reader :product, :quantity, :slots

  def initialize(product, slots)
    @product = product
    @quantity = 1
    @slots = slots
  end


  def increment_quantity
    @quantity += 1
  end

  def name
    @product.name
  end

  def price
    @product.price * @quantity * @slots
  end

end

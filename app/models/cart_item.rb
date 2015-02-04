require 'json'

class CartItem
  attr_reader :product, :slots, :order

  def initialize(product, order)
    @product = Product.find_by_id(product)
    @slots = order[:slots].to_i
    @order = order.to_json
  end

  def name
    @product.name
  end

  def price
    @product.price.to_f * @slots.to_f * 0.01
  end

end

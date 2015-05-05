require 'json'
require "ohm"

class CartItem
  attr_reader :product, :slots, :order, :listId

  def initialize(product, order)
    @product = Product.find_by_id(product)
    @slots = order[:slots].to_i
    @order = order.to_json
    @listId = ListId
  end

  def name
    @product.name
  end

  def order
    var = JSON.parse(@order)
  end

  def price
    @product.price.to_f * @slots.to_f * 0.01
  end

end

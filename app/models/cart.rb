require 'json'
class Cart
  attr_reader :items, :id

  def initialize(idi = -1)
    @items = []
    if(idi == -1)
      @id = $redis.INCR('cartId')
    else
      @id = idi
    end
  end

  def total_price
    @items.sum {|item| item.price }
  end

  def id
    @id
  end

  def items
    idd = @id.to_s
    itemIds = []
    for i in 0..$redis.LLEN("itemLists:#{idd}") - 1
      itemIds << $redis.LINDEX("itemLists:#{idd}", i).to_s
    end

    itemIds.each do |iId|
      @items << JSON.parse($redis.GET("items:#{iId}"))
    end
    @items
  end

  def add_product(product, order)
    itemId = $redis.INCR('itemId')
    aId = "itemLists:" + @id.to_s
    $redis.RPUSH(aId, "#{itemId}")
    $redis.SET("items:#{itemId}", order.to_json)
  end

end

require 'json'
class Cart
  attr_reader :items, :id, :itemIds

  def initialize(idi = -1)
    @items = []
    if(idi == -1)
      @id = $redis.INCR('cartId')
    else
      @id = idi
    end

    @itemIds = []
    for i in 0..$redis.LLEN("itemLists:#{id}") - 1
      @itemIds << $redis.LINDEX("itemLists:#{id}", i).to_s
    end
    @itemIds.each do |iId|
      @items << JSON.parse($redis.GET("items:#{iId}"))
    end
  end

  def total_price
    @items.sum {|item| (item['nSlots'].to_i * 40) * 0.01 }
  end

  ##
  def id
    @id
  end

  ##
  def items
    @items
  end

  # Return number of items
  def count
    @items.count
  end

  #is empty?
  def empty
    if(@items.count == 0)
      true
    else
      false
    end
  end

  ##
  def add_product(product, order)
    itemId = $redis.INCR('itemId')
    $redis.RPUSH("itemLists:#{id}", "#{itemId}")
    @itemIds << itemId
    order['product'] = 'Mumble Server'
    order['listId'] = $redis.GET('itemId')
    $redis.SET("items:#{itemId}", order.to_json)
  end

  #Remove an item from the list
  def delete_item(itemID)
    $redis.DEL("items:#{itemID}")
    @itemIds.delete(itemID)
    $redis.LREM("itemLists:#{id}", -1, "#{itemID}")
  end

  def delete_cart
    @itemIds.each do |aId|
      $redis.DEL("items:#{aId}")
    end
    $redis.DEL("itemLists:#{id}")
  end

end

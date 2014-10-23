class Order < ActiveRecord::Base

  def self.getCurrentOrder(user)
    Order.find_by_sql(["SELECT * FROM Orders LIMIT 1 WHERE serverId IS NULL AND (userId = ?)", user])
  end

end

require 'active_record'
class Order < ActiveRecord::Base

  def self.getCurrentOrder(user)
    Order.find_by_sql(["SELECT * FROM orders WHERE serverId IS NULL AND (userId = ?) LIMIT 1", user])
  end

end

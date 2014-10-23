class AddServerIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :serverId, :integer
  end

  def self.down
    remove_column :orders, :serverId
  end
end

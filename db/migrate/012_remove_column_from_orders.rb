class RemoveColumnFromOrders < ActiveRecord::Migration
  def self.up
    remove_column :orders, :paymentMethod
  end

  def self.down
  end
end

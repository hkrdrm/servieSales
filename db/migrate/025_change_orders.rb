class ChangeOrders < ActiveRecord::Migration
  def self.up
    remove_column :orders, :expires
  end

  def self.down
    add_column :orders, :expires
  end
end

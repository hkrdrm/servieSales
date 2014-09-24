class AddNslotsToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :nSlots, :integer
  end

  def self.down
    remove_column :orders, :nSlots
  end
end

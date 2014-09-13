class AddPriceColumnToSubscription < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :price, :integer
  end

  def self.down
    remove_column :subscriptions, :price
  end
end

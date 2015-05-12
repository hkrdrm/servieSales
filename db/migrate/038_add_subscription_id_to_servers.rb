class AddSubscriptionIdToServers < ActiveRecord::Migration
  def self.up
    add_column :servers, :subscriptionId, :string
  end

  def self.down
    remove_column :servers, :subscriptionId
  end
end

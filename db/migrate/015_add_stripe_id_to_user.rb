class AddStripeIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :stripeId, :string
  end

  def self.down
    remove_column :users, :stripeId
  end
end

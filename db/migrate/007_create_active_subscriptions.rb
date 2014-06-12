class CreateActiveSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :active_subscriptions do |t|
      t.integer :userId
      t.integer :subscriptionId
      t.date :renewalDate
      t.timestamps
    end
  end

  def self.down
    drop_table :active_subscriptions
  end
end
